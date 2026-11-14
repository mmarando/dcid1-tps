

### CCOPT configuration

set cts_inv_cells   "CLKINVX2LVT CLKINVX4LVT CLKINVX8LVT"
set cts_buff_cells  "CLKBUFX2LVT CLKBUFX4LVT CLKBUFX8LVT"
set cts_cg_cells    "TLATNTSCAX2LVT TLATNTSCAX4LVT"
set cts_logic_cells "CLKAND2X2LVT CLKMX2X2LVT CLKXOR2X2LVT"
set_ccopt_mode -integration native 
set_ccopt_property inverter_cells     $cts_inv_cells
set_ccopt_property buffer_cells       $cts_buff_cells
set_ccopt_property clock_gating_cells $cts_cg_cells
set_ccopt_property logic_cells        $cts_logic_cells

# select inverters 
set_ccopt_property use_inverters true
# set target skew and max trans (this is ignored with useful skew medium or extreme)
set_ccopt_property target_skew      0.100
set_ccopt_property target_max_trans 0.080


# create skew groups
#create_ccopt_skew_group -name clock \
#			-from_clocks [get_clocks clock] \
#			-target_insertion_delay 0.800 \
#			-target_skew 0.85 \
#			-constrains all \
#			-auto_sinks \
#			-sources i_clock
#
#create_ccopt_skew_group -name div2_clock \
#			-from_clocks [get_clocks clk_div2] \
#			-target_insertion_delay 0.500 \
#			-target_skew 0.85 \
#			-constrains all \
#			-auto_sinks \
#			-source gen_clock_reg/Q
#

# can select settings for different type of nets
set_ccopt_property -net_type trunk target_max_trans 0.080
set_ccopt_property -net_type leaf  target_max_trans 0.080
#skew can be set per skew group
#set_ccopt_property -skew_group group1/view target_skew 0.100
# overrides cts_target_slew for non-leaf nets
set_ccopt_mode -cts_target_nonleaf_slew 0.080
#slew / skew setting for different corner, need specify corresponding corner delay name
#set_ccopt_property target_skew 0.1 -delay_corner setup_rcworst 
#set_ccopt_property target_max_trans 0.1 -delay_corner setup_rcworst
set_ccopt_property size_logic true
set_ccopt_property post_conditioning_enable_drv_fixing true
set_ccopt_property post_conditioning_enable_drv_fixing_by_rebuffering true
set_ccopt_property post_conditioning_enable_skew_fixing true
set_ccopt_property post_conditioning_enable_skew_fixing_by_rebuffering true
#set_ccopt_property target_max_capacitance 0.100
set_ccopt_property allow_resize_of_dont_touch_cells false

if {1} {
	set_ccopt_property clone_clock_gates true
	set_ccopt_property merge_clock_gates  true
	set_ccopt_property merge_clock_logic true
}

#NDR definition

add_ndr -name trunk_ndr_2xw_2xs \
	-width {Metal9 0.16 Metal10 0.44 Metal11 0.44} \
	-spacing {Metal9 0.14 Metal10 0.4 Metal11 0.4} \
	-via {{M11_M10_2x1_VH_E} {M11_M10_2x1_VH_W} {M11_M10_1x2_VH_N} {M11_M10_1x2_VH_S} \
			    {M10_M9_2x1_HV_E} {M10_M9_2x1_HV_W} {M10_M9_1x2_HV_N} {M10_M9_1x2_HV_S} \
			    {M9_M8_2x1_VH_E} {M9_M8_2x1_HV_W} {M9_M8_1x2_HV_N} {M9_M8_1x2_HV_S} }

add_ndr -name leaf_ndr_2xw_2xs \
	-width {Metal1 0.12  Metal2 0.16 Metal3 0.16 Metal4 0.16 Metal5 0.16 Metal6 0.16 Metal7 0.16 Metal8 0.16} \
	-spacing {Metal1 0.12 Metal2 0.14 Metal3 0.14 Metal4 0.14 Metal5 0.14 Metal6 0.14 Metal7 0.14 Metal8 0.14} \
	-via {{M2_M1_2x1_HV_E} {M2_M1_2x1_HV_W} {M2_M1_1x2_HV_N} {M2_M1_1x2_HV_S} \
			     {M3_M2_2x1_VH_E} {M3_M2_2x1_HV_W} {M3_M2_1x2_HV_N} {M3_M2_1x2_HV_S} \
			     {M4_M3_2x1_VH_E} {M4_M3_2x1_HV_W} {M4_M3_1x2_HV_N} {M4_M3_1x2_HV_S} \
			     {M5_M4_2x1_VH_E} {M5_M4_2x1_HV_W} {M5_M4_1x2_HV_N} {M5_M4_1x2_HV_S} \
			     {M6_M5_2x1_VH_E} {M6_M5_2x1_HV_W} {M6_M5_1x2_HV_N} {M6_M5_1x2_HV_S} \
			     {M7_M6_2x1_VH_E} {M7_M6_2x1_HV_W} {M7_M6_1x2_HV_N} {M7_M6_1x2_HV_S} \
			     {M8_M7_2x1_VH_E} {M8_M7_2x1_HV_W} {M8_M7_1x2_HV_N} {M8_M7_1x2_HV_S} }

create_route_type -name clock_trunk_ndr -top_preferred_layer 11 -bottom_preferred_layer 8 \
		  -preferred_routing_layer_effort high \
                  -non_default_rule trunk_ndr_2xw_2xs \
		  -min_stack_layer 4

create_route_type -name clock_leaf_ndr -top_preferred_layer 8 -bottom_preferred_layer 2 \
                  -preferred_routing_layer_effort high \
                  -non_default_rule leaf_ndr_2xw_2xs \
                  -min_stack_layer 4

set_ccopt_property route_type clock_trunk_ndr -net_type trunk
set_ccopt_property route_type -net_type leaf clock_leaf_ndr

set_ccopt_property route_type_override_preferred_routing_layer_effort none


# create skew groups
#create_ccopt_skew_group -name clock \
#			-from_clocks clock \
#			-target_insertion_delay 0.800 \
#			-target_skew 0.10 \
#			-constrains all \
#			-auto_sinks \
#			-sources i_clock
#
#create_ccopt_skew_group -name div2_clock \
#			-from_clocks clk_div2 \
#			-target_insertion_delay 0.800 \
#			-target_skew 0.10 \
#			-constrains all \
#			-auto_sinks \
#			-source gen_clock_reg/Q
#
clock_opt_design
