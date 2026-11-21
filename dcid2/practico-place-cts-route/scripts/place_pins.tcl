# Ejercicio 2: ubicacion de pines, una cara por grupo
# Uso: en la pausa (suspend) de floorplan.tcl, hacer: source ./scripts/place_pins.tcl
# Genera scripts/pinfile para que las proximas corridas lo carguen con loadPtnPin.
#
# Capas: Metal1/3/5/... son horizontales, Metal2/4/6/... son verticales (ver add_tracks
# en floorplan.tcl). Cara LEFT/RIGHT -> capa horizontal. Cara TOP/BOTTOM -> capa vertical.
# Editar solo esta tabla: {grupo cara capa patron_de_nombres}

set pin_groups {
    {datos_in   LEFT   Metal5 {i_data*}}
    {parametros BOTTOM Metal4 {i_coeffs* i_reset}}
    {clock      RIGHT  Metal5 {i_clock}}
    {datos_out  TOP    Metal4 {o_data*}}
}
set pin_spacing_tracks 2

foreach g $pin_groups {
    lassign $g gname gside glayer gpatterns

    # editPin no acepta wildcards: se expande la lista de puertos con get_db
    set names {}
    foreach pat $gpatterns {
        foreach n [get_db [get_db ports $pat] .name] { lappend names $n }
    }
    if {[llength $names] == 0} {
        puts "ERROR place_pins: grupo $gname sin puertos (patrones: $gpatterns)"
        continue
    }
    puts "place_pins: $gname -> $gside $glayer ([llength $names] pines)"

    editPin -pin $names \
            -side $gside \
            -layer $glayer \
            -spreadType CENTER \
            -spacing $pin_spacing_tracks -unit TRACK \
            -snap TRACK \
            -fixOverlap 1 \
            -fixedPin 1
}

# Verificacion y guardado
checkPinAssignment -outFile reports/checkPin.rpt
savePtnPin -design scripts/pinfile
puts "place_pins: pinfile guardado en scripts/pinfile, reporte en reports/checkPin.rpt"

