########################################################################
# Power Grid Script - 45nm TSMC (M1?M4) - Innovus
########################################################################

#---------------------------------------
# Config básica
#---------------------------------------
set design [get_db current_design .name]
set pg_nets {VDD VSS}

# Spacing / pitch global del grid (ejemplo: 3.42 de tu script)
set pg_pitch 3.42

# Offsets de M1 (rails horizontales)
set m1_vdd_start 1.65
set m1_vss_start 3.36

#---------------------------------------
# Helper: borrar PG special wires de una capa
#---------------------------------------
proc pg_delete_layer_pg {layer_name} {
    set delset [get_db pg_nets .special_wires -if {.layer.name==$layer_name}]
    if {[llength $delset] > 0} {
        select_obj $delset
        deleteSelectedFromFPlan
    }
}

#---------------------------------------
# Helper: configurar via gen y crear vias entre dos capas
#---------------------------------------
proc pg_create_vias {via_rule bot_layer top_layer} {
    setViaGenMode -reset
    setViaGenMode -extend_out_wire_end    false
    setViaGenMode -allow_via_expansion    false
    setViaGenMode -viarule_preference     [list $via_rule]
    editPowerVia -add_vias 1 -bottom_layer $bot_layer -top_layer $top_layer
}

########################################################################
# 0) Conectar rails M1 a pines de stdcells
########################################################################

setSrouteMode -connectBrokenCorePin true
sroute -connect corePin

# Modo addStripe para que no meta vias donde no debe
setAddStripeMode -skip_via_on_pin {block cover pad physicalpin standardcell}
setAddStripeMode -skip_via_on_wire_shape {blockring blockwire corewire fillwire followpin iowire noshape padring ring stripe}
setAddStripeMode -stapling_shift false
setAddStripeMode -use_exact_spacing true
setAddStripeMode -remove_floating_stapling false

########################################################################
# 1) M1 Rails horizontales
########################################################################

pg_delete_layer_pg Metal1

set m1_w [expr 2.0 * [get_db layer:Metal1 .width]]

set core_height [get_db design:${design} .core_bbox.ur.y]
set m1_stop_VDD [expr $core_height + $pg_pitch]
set m1_stop_VSS [expr $core_height + $pg_pitch/2.0]

# VDD en M1
addStripe \
    -nets VDD \
    -layer Metal1 \
    -direction horizontal \
    -width $m1_w \
    -spacing $pg_pitch \
    -start $m1_vdd_start \
    -set_to_set_distance $pg_pitch \
    -switch_layer_over_obs false \
    -snap_wire_center_to_grid Grid \
    -use_wire_group 1 \
    -use_wire_group_bits 1 \
    -stop $m1_stop_VDD

# VSS en M1
addStripe \
    -nets VSS \
    -layer Metal1 \
    -direction horizontal \
    -width $m1_w \
    -spacing $pg_pitch \
    -start $m1_vss_start \
    -set_to_set_distance $pg_pitch \
    -switch_layer_over_obs false \
    -snap_wire_center_to_grid Grid \
    -use_wire_group 1 \
    -use_wire_group_bits 1 \
    -stop $m1_stop_VSS

########################################################################
# 2) M2 Stripes (ej: vertical, stapling hacia M3)
########################################################################

pg_delete_layer_pg Metal2

set m2_w [expr 2.0 * [get_db layer:Metal2 .width]]

# Área de bloqueo (usar core bbox para no pisar IO)
set core_urx  [get_db current_design .core_bbox.ur.x]
set die_lly   [get_db current_design .bbox.ll.y]
set die_urx   [get_db current_design .bbox.ur.x]
set die_ury   [get_db current_design .bbox.ur.y]

set m2_area_blockage "$core_urx $die_lly $die_urx $die_ury"

# VDD en M2
addStripe \
    -nets VDD \
    -stapling "0.880 1.80 3.42:1 Metal3" \
    -layer Metal2 \
    -width $m2_w \
    -set_to_set_distance $pg_pitch \
    -start $m1_vss_start \
    -snap_wire_center_to_grid Grid \
    -switch_layer_over_obs false \
    -area_blockage "$m2_area_blockage"

# VSS en M2
addStripe \
    -nets VSS \
    -stapling "0.880 3.51 3.42:1 Metal3" \
    -layer Metal2 \
    -width $m2_w \
    -set_to_set_distance $pg_pitch \
    -start $m1_vss_start \
    -snap_wire_center_to_grid Grid \
    -switch_layer_over_obs false \
    -area_blockage "$m2_area_blockage"

# Vias M1?M2
pg_create_vias Via1 Metal1 Metal2

########################################################################
# 3) M3 Stripes horizontales (ej: trunks over core)
########################################################################

pg_delete_layer_pg Metal3

set m3_w [expr 2.0 * [get_db layer:Metal3 .width]]

# Podés recortar un poquito por arriba si querés dejar espacio a otro ring
set top_cut 1.71
set m3_area_blockage "$core_urx $die_lly $die_urx [expr $die_ury - $top_cut]"

# VDD en M3
addStripe \
    -nets VDD \
    -stapling "0.880 3.50 3.42:1 Metal3" \
    -layer Metal3 \
    -direction horizontal \
    -width $m3_w \
    -set_to_set_distance $pg_pitch \
    -start 1.60 \
    -snap_wire_center_to_grid Grid \
    -switch_layer_over_obs false \
    -area_blockage "$m3_area_blockage"

# VSS en M3
addStripe \
    -nets VSS \
    -stapling "0.880 3.51 3.42:1 Metal3" \
    -layer Metal3 \
    -direction horizontal \
    -width $m3_w \
    -set_to_set_distance $pg_pitch \
    -start $m1_vss_start \
    -snap_wire_center_to_grid Grid \
    -switch_layer_over_obs false \
    -area_blockage "$m3_area_blockage"

# Vias M2?M3
pg_create_vias Via2 Metal2 Metal3

########################################################################
# 4) M4 Stripes (ej: vertical u horizontal, según tu grid)
########################################################################

pg_delete_layer_pg Metal4

# Ojo: en tu ejemplo usabas width de Metal2. Normalmente usarías la de Metal4.
set m4_w [expr 2.0 * [get_db layer:Metal4 .width]]

set m4_area_blockage "$core_urx $die_lly $die_urx $die_ury"

# VDD en M4
addStripe \
    -nets VDD \
    -stapling "0.880 1.80 3.42:1 Metal4" \
    -layer Metal4 \
    -width $m4_w \
    -set_to_set_distance $pg_pitch \
    -start $m1_vss_start \
    -snap_wire_center_to_grid Grid \
    -switch_layer_over_obs false \
    -area_blockage "$m4_area_blockage"

# VSS en M4
addStripe \
    -nets VSS \
    -stapling "0.880 3.51 3.42:1 Metal4" \
    -layer Metal4 \
    -width $m4_w \
    -set_to_set_distance $pg_pitch \
    -start $m1_vss_start \
    -snap_wire_center_to_grid Grid \
    -switch_layer_over_obs false \
    -area_blockage "$m4_area_blockage"

# Vias M3?M4
pg_create_vias Via3 Metal3 Metal4

########################################################################
# Fin del PG script base
########################################################################
puts ">>> Power grid M1?M4 generado para $design"
