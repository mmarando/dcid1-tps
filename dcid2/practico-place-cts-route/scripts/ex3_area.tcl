# Ejercicio 3: suma del area de las celdas funcionales con get_db (sin report_area)
# Uso dentro de Innovus: source ex3_area.tcl

set total 0.0
set count 0

foreach inst [get_db insts] {
    set cell [get_db $inst .base_cell.name]
    set cls  [get_db $inst .base_cell.class]

    # Excluir celdas no funcionales (fillers, tapcells, decaps, antenna)
    if {[regexp -nocase {fill|tap|decap|antenna} "$cls $cell"]} {
        continue
    }

    set area [get_db $inst .base_cell.area]
    set total [expr {$total + $area}]
    incr count
}

puts "Celdas funcionales: $count"
puts "Area total de celdas funcionales: [format %.4f $total] um^2"
