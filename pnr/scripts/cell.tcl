# 
# Dado el nombre de una instancia:
# - Si la celda es LVT o ULVT, intenta swappear a su equivalente HVT.
# - Si no existe el mismo drive, busca drives vecinos (más chicos/más grandes).
# - Si no encuentra ningún HVT, deja la celda original.
########################################################################

# Helper: chequea si existe una lib cell con ese nombre
proc cell_exists {libcell_name} {
    # Usamos catch para evitar mensajes feos si algo falla
    if {[catch {set cells [get_lib_cells $libcell_name]}]} {
        return 0
    }
    if {[llength $cells] > 0} {
        return 1
    }
    return 0
}

# Helper: intenta encontrar una celda HVT con mismo prefijo y drive cercano
# base:  "INVX" (por ejemplo)
# drive: "1" (como número)
# max_delta: cuánto nos movemos para arriba/abajo en drive
proc find_svt_variant {base drive max_delta} {
    set drive_int [expr {$drive + 0}]   ;# aseguramos que sea numérico

    # Primero intentamos mismo drive
    set candidate "${base}${drive_int}HVT"
    if {[cell_exists $candidate]} {
        return $candidate
    }

    # Después buscamos alrededor: X(drive-1), X(drive+1), X(drive-2), X(drive+2), etc.
    for {set delta 1} {$delta <= $max_delta} {incr delta} {
        set down [expr {$drive_int - $delta}]
        if {$down > 0} {
            set cand_down "${base}${down}HVT"
            if {[cell_exists $cand_down]} {
                return $cand_down
            }
        }

        set up [expr {$drive_int + $delta}]
        set cand_up "${base}${up}HVT"
        if {[cell_exists $cand_up]} {
            return $cand_up
        }
    }

    # Si no encontramos nada, devolvemos string vacío
    return ""
}

# Procedimiento principal: swappear una instancia puntual
proc swap_inst_to_svt {inst_name} {
    # Buscamos la instancia en la DB
    #set instp [dbget -p top.insts.name $inst_name]
    set instp $inst_name
    if {$instp eq ""} {
        puts "WARN: no se encontró la instancia '$inst_name' en la base de datos."
        return
    }

    #set cell_name [dbget $instp.cell.name]
    set cell_name [get_db inst:$instp .ref_name]

    # Matcheamos algo del estilo: INVX1LVT / NAND2X4ULVT / etc.
    # Patron: (prefijo+X)(drive)(LVT|HVT)
    if {![regexp {(.+X)([0-9]+)(LVT|HVT)} $cell_name -> base drive vt]} {
        puts "INFO: no se pudo parsear el nombre de celda '$cell_name', se deja como está."
        return
    }

    # Si ya es HVT, no hacemos nada
    if {$vt eq "HVT"} {
        puts "INFO: la instancia '$inst_name' ya usa una celda HVT ($cell_name)."
        return
    }

    # Sólo actuamos si es LVT o ""
    if {![string match "*LVT" $vt] && ![string match "" $vt]} {
        puts "INFO: la instancia '$inst_name' no es LVT/HVT ($cell_name), se deja como está."
        return
    }

    # Buscamos un equivalente en HVT (mismo drive o vecinos)
    set new_libcell [find_svt_variant $base $drive 8]  ;# 8 es un ejemplo de rango de búsqueda

    if {$new_libcell eq ""} {
        puts "INFO: no se encontró variante HVT para '$cell_name'. La instancia '$inst_name' queda igual."
        return
    }

    # Swapeamos la celda
    puts "SWAP: instancia '$inst_name' : $cell_name  ->  $new_libcell"
    # Innovus:
    ecoChangeCell -inst $inst_name -cell $new_libcell
    # Si estás en Genus u otra herramienta y el comando difiere, adaptar acá
}

########################################################################
# Ejemplos de uso:
#
#   swap_inst_to_svt U1234
#   swap_inst_to_svt U_INV_45
########################################################################
