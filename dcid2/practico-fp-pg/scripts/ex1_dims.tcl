# Ejercicio 1: dimensiones del floorplan para una utilizacion objetivo
# Uso: set util_target 0.70; set aspect 2.0; (antes de source floorplan.tcl)
#   aspect = ancho/alto del core (distinto de 1 para que no sea cuadrado)
# Requiere el diseno cargado (init_design) para sumar el area de celdas.

set site_w 0.2
set row_h  1.71
set core2edge_lr 2
set core2edge_tb 1.71

if {![info exists util_target]} { set util_target 0.70 }
if {![info exists aspect]}      { set aspect 2.0 }

source ./scripts/ex3_area.tcl   ;# deja el area funcional en $total (um^2)

set core_area [expr {$total / $util_target}]
set h_raw     [expr {sqrt($core_area / $aspect)}]
set w_raw     [expr {$h_raw * $aspect}]

# core: ancho multiplo de site, alto multiplo de row (redondeo hacia arriba)
set core_w [expr {ceil($w_raw / $site_w) * $site_w}]
set core_h [expr {ceil($h_raw / $row_h) * $row_h}]

# die = core + margenes (floorplan -d usa dimensiones de die con -coreMarginsBy die)
set design_width  [format %.2f [expr {$core_w + 2 * $core2edge_lr}]]
set design_height [format %.2f [expr {$core_h + 2 * $core2edge_tb}]]

puts "Area funcional : [format %.2f $total] um^2"
puts "Util objetivo  : $util_target  aspect: $aspect"
puts "Core           : $core_w x $core_h  (util real [format %.3f [expr {$total / ($core_w * $core_h)}]])"
puts "Die            : $design_width x $design_height"
