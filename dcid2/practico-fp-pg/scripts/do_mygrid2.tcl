########################################################################
# Power Grid Script - 45nm TSMC (M1?M11) - Innovus
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

# Stapling genérico (lo reusamos en varias capas)
set stapling_vdd "0.880 1.80 3.42:1"
set stapling_vss "0.880 3.51 3.42:1"

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
# Coordenadas útiles
########################################################################

set core_height [get_db design:${design} .core_bbox.ur.y]
set core_urx    [get_db current_design .core_bbox.ur.x]
set die_lly     [get_db current_design .bbox.ll.y]
set die_urx     [get_db current_design .bbox.ur.x]
set die_ury     [get_db current_design .bbox.ur.y]

########################################################################
# 1) M1 Rails horizontales
########################################################################

pg_delete_layer_pg Metal1

set m1_w [expr 2.0 * [get_db layer:Metal1 .width]]

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
set m2_area_blockage "$core_urx $die_lly $die_urx $die_ury"

# VDD en M2
addStripe \
    -nets VDD \
    -stapling "$stapling_vdd Metal3" \
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
    -stapling "$stapling_vss Metal3" \
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
# 3) M3 Stripes horizontales
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
    -stapling "$stapling_vss Metal3" \
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
# 4) M4 Stripes
########################################################################

pg_delete_layer_pg Metal4

set m4_w [expr 2.0 * [get_db layer:Metal4 .width]]
set m4_area_blockage "$core_urx $die_lly $die_urx $die_ury"

# VDD en M4
addStripe \
    -nets VDD \
    -stapling "$stapling_vdd Metal4" \
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
    -stapling "$stapling_vss Metal4" \
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
# 5) M5?M11 (genérico)
#    - M5 y M8: full stripe (SIN stapling)
#    - resto: usa stapling genérico
########################################################################

# Lista de capas altas
set high_layers {Metal5 Metal6 Metal7 Metal8 Metal9 Metal10 Metal11}

# Modo por capa (full stripe vs stapled)
array set pg_layer_mode {
    Metal5 full
    Metal8 full
    Metal6 stapled
    Metal7 stapled
    Metal9 stapled
    Metal10 stapled
    Metal11 stapled
}

# Via rule por capa (prev_layer -> layer)
array set pg_via_rule {
    Metal5  Via4
    Metal6  Via5
    Metal7  Via6
    Metal8  Via7
    Metal9  Via8
    Metal10 Via9
    Metal11 Via10
}

# Si querés alternar direcciones explícitamente, podés setear acá
# (si no, dejá que use la dirección preferida de la tech)
array set pg_layer_dir {
    Metal5 horizontal
    Metal6 vertical
    Metal7 horizontal
    Metal8 vertical
    Metal9 horizontal
    Metal10 vertical
    Metal11 horizontal
}

set prev_layer Metal4

foreach layer $high_layers {
    pg_delete_layer_pg $layer

    set w [expr 2.0 * [get_db layer:$layer .width]]
    set area_blockage "$core_urx $die_lly $die_urx $die_ury"
    set mode $pg_layer_mode($layer)
    set dir  $pg_layer_dir($layer)

    # VDD stripe
    if {$mode eq "full"} {
        # FULL STRIPE (sin stapling)
        addStripe \
            -nets VDD \
            -layer $layer \
            -direction $dir \
            -width $w \
            -set_to_set_distance $pg_pitch \
            -start $m1_vss_start \
            -snap_wire_center_to_grid Grid \
            -switch_layer_over_obs false \
            -area_blockage "$area_blockage"
    } else {
        # STAPLED
        addStripe \
            -nets VDD \
            -stapling "$stapling_vdd $layer" \
            -layer $layer \
            -direction $dir \
            -width $w \
            -set_to_set_distance $pg_pitch \
            -start $m1_vss_start \
            -snap_wire_center_to_grid Grid \
            -switch_layer_over_obs false \
            -area_blockage "$area_blockage"
    }

    # VSS stripe
    if {$mode eq "full"} {
        addStripe \
            -nets VSS \
            -layer $layer \
            -direction $dir \
            -width $w \
            -set_to_set_distance $pg_pitch \
            -start $m1_vss_start \
            -snap_wire_center_to_grid Grid \
            -switch_layer_over_obs false \
            -area_blockage "$area_blockage"
    } else {
        addStripe \
            -nets VSS \
            -stapling "$stapling_vss $layer" \
            -layer $layer \
            -direction $dir \
            -width $w \
            -set_to_set_distance $pg_pitch \
            -start $m1_vss_start \
            -snap_wire_center_to_grid Grid \
            -switch_layer_over_obs false \
            -area_blockage "$area_blockage"
    }

    # Vias prev_layer -> layer
    pg_create_vias $pg_via_rule($layer) $prev_layer $layer
    set prev_layer $layer
}

########################################################################
# Fin del PG script
########################################################################
puts ">>> Power grid M1?M11 generado para $design"
