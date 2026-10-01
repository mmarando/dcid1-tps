#######################
# M1 rail creation
#######################

setSrouteMode -connectBrokenCorePin true
sroute -connect corePin

setAddStripeMode -skip_via_on_pin {block cover pad physicalpin standardcell}
setAddStripeMode -skip_via_on_wire_shape {blockring blockwire corewire fillwire followpin iowire noshape padring ring stripe}
setAddStripeMode -stapling_shift false
setAddStripeMode -use_exact_spacing true
setAddStripeMode -remove_floating_stapling false


# M1 stripe
set m1_track [get_db layer:Metal1 .pitch_x]
set m1_w     [expr 2 * [get_db layer:Metal1 .width]]
set m1_s     3.42; #[get_db layer:Metal1 .min_spacing]

set core_height [get_db design:${design} .core_bbox.ur.y]
set m1_stop_VDD     [expr $core_height + $m1_s]
set m1_stop_VSS     [expr $core_height + $m1_s/2]
set delset       [get_db pg_nets .special_wires -if {.layer.name==Metal1}]
select_obj $delset
deleteSelectedFromFPlan
addStripe \
 -nets VDD \
 -layer Metal1 \
 -direction horizontal \
 -width $m1_w \
 -spacing $m1_s \
 -start 1.65 \
 -set_to_set_distance 3.42 \
 -switch_layer_over_obs false \
 -snap_wire_center_to_grid Grid \
 -use_wire_group 1 \
 -use_wire_group_bits 1 \
 -stop $m1_stop_VDD


addStripe \
 -nets VSS \
 -layer Metal1 \
 -direction horizontal \
 -width $m1_w \
 -spacing $m1_s \
 -start 3.36 \
 -set_to_set_distance 3.42 \
 -switch_layer_over_obs false \
 -snap_wire_center_to_grid Grid \
 -use_wire_group 1 \
 -use_wire_group_bits 1 \
 -stop $m1_stop_VSS

######################
#  M2 segment config
######################

set delset       [get_db pg_nets .special_wires -if {.layer.name==Metal2}]
select_obj $delset
deleteSelectedFromFPlan


addStripe \
	-nets VDD \
	-stapling "0.880 1.8 3.42:1 Metal3" \
	-layer Metal2 \
	-width [expr 2 * [get_db layer:Metal2 .width]] \
	-set_to_set_distance 3.42 \
	-start 3.36 \
	-snap_wire_center_to_grid Grid \
	-switch_layer_over_obs false \
	-area_blockage "[get_db current_design .core_bbox.ur.x] [get_db current_design .bbox.ll.y] [get_db current_design .bbox.ur.x] [get_db current_design .bbox.ur.y]"

addStripe \
        -nets VSS \
        -stapling "0.880 3.51 3.42:1 Metal3" \
        -layer Metal2 \
        -width [expr 2 * [get_db layer:Metal2 .width]] \
        -set_to_set_distance 3.42 \
        -start 3.36 \
        -snap_wire_center_to_grid Grid \
        -switch_layer_over_obs false \
        -area_blockage "[get_db current_design .core_bbox.ur.x] [get_db current_design .bbox.ll.y] [get_db current_design .bbox.ur.x] [get_db current_design .bbox.ur.y]"


# connfiguring vias
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference {Via1}
editPowerVia -add_vias 1 -bottom_layer Metal1 -top_layer Metal2

######################
#  M3 segment config
######################

set delset       [get_db pg_nets .special_wires -if {.layer.name==Metal3}]
select_obj $delset
deleteSelectedFromFPlan


addStripe \
        -nets VDD \
        -stapling "0.880 3.5 3.42:1 Metal3" \
        -layer Metal3 \
	-direction horizontal \
        -width [expr 2 * [get_db layer:Metal3 .width]] \
        -set_to_set_distance 3.42 \
        -start 1.6 \
        -snap_wire_center_to_grid Grid \
        -switch_layer_over_obs false \
        -area_blockage "[get_db current_design .core_bbox.ur.x] [get_db current_design .bbox.ll.y] [get_db current_design .bbox.ur.x] [expr [get_db current_design .bbox.ur.y] - 1.71]"

addStripe \
        -nets VSS \
        -stapling "0.880 3.51 3.42:1 Metal3" \
        -layer Metal3 \
	-direction horizontal \
        -width [expr 2 * [get_db layer:Metal3 .width]] \
        -set_to_set_distance 3.42 \
        -start 3.36 \
        -snap_wire_center_to_grid Grid \
        -switch_layer_over_obs false \
        -area_blockage "[get_db current_design .core_bbox.ur.x] [get_db current_design .bbox.ll.y] [get_db current_design .bbox.ur.x] [get_db current_design .bbox.ur.y]"

# connfiguring vias
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference {Via2}
editPowerVia -add_vias 1 -bottom_layer Metal2 -top_layer Metal3




######################
#  M4 segment config
######################

set delset       [get_db pg_nets .special_wires -if {.layer.name==Metal4}]
select_obj $delset
deleteSelectedFromFPlan


addStripe \
	-nets VDD \
	-stapling "0.880 1.8 3.42:1 Metal4" \
	-layer Metal4 \
	-width [expr 2 * [get_db layer:Metal2 .width]] \
	-set_to_set_distance 3.42 \
	-start 3.36 \
	-snap_wire_center_to_grid Grid \
	-switch_layer_over_obs false \
	-area_blockage "[get_db current_design .core_bbox.ur.x] [get_db current_design .bbox.ll.y] [get_db current_design .bbox.ur.x] [get_db current_design .bbox.ur.y]"

addStripe \
        -nets VSS \
        -stapling "0.880 3.51 3.42:1 Metal4" \
        -layer Metal4 \
        -width [expr 2 * [get_db layer:Metal2 .width]] \
        -set_to_set_distance 3.42 \
        -start 3.36 \
        -snap_wire_center_to_grid Grid \
        -switch_layer_over_obs false \
        -area_blockage "[get_db current_design .core_bbox.ur.x] [get_db current_design .bbox.ll.y] [get_db current_design .bbox.ur.x] [get_db current_design .bbox.ur.y]"


# connfiguring vias
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference {Via3}
editPowerVia -add_vias 1 -bottom_layer Metal3 -top_layer Metal4

