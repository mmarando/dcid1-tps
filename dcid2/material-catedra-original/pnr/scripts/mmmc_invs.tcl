#set netlist "./dataout/fir_serial_parallel_m.v"
#set sdc     "./dataout/fir_serial_parallel_m.sdc"

#read_netlist $netlist

# libraries
#set libpath "/home/amslib/PDKs/gpdk045v6"
## libs for setup
#set hvt_slow "${libpath}/gsclib045_hvt/timing/slow_vdd1v0_basicCells_hvt.lib"
#set svt_slow "${libpath}/gsclib045/timing/slow_vdd1v0_basicCells.lib"
#set lvt_slow "${libpath}/gsclib045_lvt/timing/slow_vdd1v0_basicCells_lvt.lib"
##libs for hold
#set hvt_fast "${libpath}/gsclib045_hvt/timing/fast_vdd1v0_basicCells_hvt.lib"
#set svt_fast "${libpath}/gsclib045/timing/fast_vdd1v0_basicCells.lib"
#set lvt_fast "${libpath}/gsclib045_lvt/timing/fast_vdd1v0_basicCells_lvt.lib"


create_library_set -name slow -timing {/home/amslib/PDKs/gpdk045v6/gsclib045_hvt/timing/slow_vdd1v0_basicCells_hvt.lib \
					/home/amslib/PDKs/gpdk045v6/gsclib045/timing/slow_vdd1v0_basicCells.lib \
					/home/amslib/PDKs/gpdk045v6/gsclib045_lvt/timing/slow_vdd1v0_basicCells_lvt.lib} 
create_library_set -name fast -timing {/home/amslib/PDKs/gpdk045v6/gsclib045_hvt/timing/fast_vdd1v0_basicCells_hvt.lib \
					/home/amslib/PDKs/gpdk045v6/gsclib045/timing/fast_vdd1v0_basicCells.lib \
					/home/amslib/PDKs/gpdk045v6/gsclib045_lvt/timing/fast_vdd1v0_basicCells_lvt.lib}

# RC fsctors for PBA vs GBA correlation
set pre_route_correlation_factor  1.00
set post_route_correlation_factor 0.95

# Preroute RC correlation factors
set pre_route_data_res [expr 0.910 * $pre_route_correlation_factor]
set pre_route_data_cap [expr 1.055 * $pre_route_correlation_factor]
set pre_route_clk_res  [expr 0.985 * $pre_route_correlation_factor]
set pre_route_clk_cap  [expr 0.960 * $pre_route_correlation_factor]

# postRoute RC correlation factors for tQuantus engine
# (postRoute RC correlatino factors are 1 for iQuantus engine)
set post_route_data_res  [expr 1.000 * $post_route_correlation_factor]
set post_route_data_cap  [expr 1.065 * $post_route_correlation_factor]
set post_route_data_xcap [expr 0.920 * $post_route_correlation_factor]
set post_route_clk_res   [expr 1.030 * $post_route_correlation_factor]
set post_route_clk_cap   [expr 0.950 * $post_route_correlation_factor]

#early rc_corner: 

create_rc_corner -T 125 \
		 -preRoute_cap     "[expr 0.95 * $pre_route_data_cap]" \
		 -preRoute_res     "$pre_route_data_res" \
		 -preRoute_clkcap  "[expr 0.95 * $pre_route_clk_cap]" \
		 -preRoute_clkres  "$pre_route_clk_res" \
                 -postRoute_cap    "[expr 0.95 * $post_route_data_cap] [expr 0.95 * $post_route_data_cap] 1" \
		 -postRoute_res    "$post_route_data_res $post_route_data_res 1" \
		 -postRoute_xcap   "$post_route_data_xcap $post_route_data_xcap 1" \
		 -postRoute_clkcap "[expr 0.95 * $post_route_clk_cap] [expr 0.95 * $post_route_clk_cap] 1" \
		 -postRoute_clkres "$post_route_clk_res $post_route_clk_res 1" \
		 -name early_spef_rcworst_125 \
		 -qx_tech_file /home/amslib/PDKs/gpdk045v6/qrc/rcworst/qrcTechFile


create_rc_corner -T 125 \
		 -preRoute_cap     "[expr 1.05 * $pre_route_data_cap]" \
		 -preRoute_res     "$pre_route_data_res" \
		 -preRoute_clkcap  "[expr 1.05 * $pre_route_clk_cap]" \
		 -preRoute_clkres  "$pre_route_clk_res" \
                 -postRoute_cap    "[expr 1.05 * $post_route_data_cap] [expr 1.05 * $post_route_data_cap] 1" \
		 -postRoute_res    "$post_route_data_res $post_route_data_res 1" \
		 -postRoute_xcap   "$post_route_data_xcap $post_route_data_xcap 1" \
		 -postRoute_clkcap "[expr 1.05 * $post_route_clk_cap] [expr 1.05 * $post_route_clk_cap] 1" \
		 -postRoute_clkres "$post_route_clk_res $post_route_clk_res 1" \
		 -name late_spef_rcworst_125 \
		 -qx_tech_file /home/amslib/PDKs/gpdk045v6/qrc/rcworst/qrcTechFile



create_rc_corner -T 0 \
		 -preRoute_cap     "[expr 0.95 * $pre_route_data_cap]" \
		 -preRoute_res     "$pre_route_data_res" \
		 -preRoute_clkcap  "[expr 0.95 * $pre_route_clk_cap]" \
		 -preRoute_clkres  "$pre_route_clk_res" \
                 -postRoute_cap    "[expr 0.95 * $post_route_data_cap] [expr 0.95 * $post_route_data_cap] 1" \
		 -postRoute_res    "$post_route_data_res $post_route_data_res 1" \
		 -postRoute_xcap   "$post_route_data_xcap $post_route_data_xcap 1" \
		 -postRoute_clkcap "[expr 0.95 * $post_route_clk_cap] [expr 0.95 * $post_route_clk_cap] 1" \
		 -postRoute_clkres "$post_route_clk_res $post_route_clk_res 1" \
		 -name early_spef_rcbest_0 \
		 -qx_tech_file /home/amslib/PDKs/gpdk045v6/qrc/rcbest/qrcTechFile


create_rc_corner -T 0 \
		 -preRoute_cap     "[expr 1.05 * $pre_route_data_cap]" \
		 -preRoute_res     "$pre_route_data_res" \
		 -preRoute_clkcap  "[expr 1.05 * $pre_route_clk_cap]" \
		 -preRoute_clkres  "$pre_route_clk_res" \
                 -postRoute_cap    "[expr 1.05 * $post_route_data_cap] [expr 1.05 * $post_route_data_cap] 1" \
		 -postRoute_res    "$post_route_data_res $post_route_data_res 1" \
		 -postRoute_xcap   "$post_route_data_xcap $post_route_data_xcap 1" \
		 -postRoute_clkcap "[expr 1.05 * $post_route_clk_cap] [expr 1.05 * $post_route_clk_cap] 1" \
		 -postRoute_clkres "$post_route_clk_res $post_route_clk_res 1" \
		 -name late_spef_rcbest_0 \
		 -qx_tech_file /home/amslib/PDKs/gpdk045v6/qrc/rcbest/qrcTechFile


create_delay_corner -name setup_rcworst -early_rc_corner early_spef_rcworst_125 \
                    -late_rc_corner late_spef_rcworst_125 -library_set slow

create_delay_corner -name hold_rcbest -early_rc_corner early_spef_rcbest_0 \
                    -late_rc_corner late_spef_rcbest_0 -library_set fast
  

create_constraint_mode -name func -sdc_files $sdc
create_analysis_view -name func_setup_ss0p9v_125c_rcworst -constraint_mode func -delay_corner setup_rcworst
create_analysis_view -name func_hold_ff1p1v_0c_rcbest     -constraint_mode func -delay_corner hold_rcbest



#create_timing_condition -name ss0p9v125c -opcond PVT_0P9V_125C -library_sets slow

#create_timing_condition -name ff1p1v0c   -opcond PVT_1P1V_0C -library_sets fast

#create_delay_corner -name setup_ss0p9v125c -timing_condition {PD1@ss0p9v125c} -rc_corner rcworst
#create_delay_corner -name hold_ff1p1v0c    -timing_condition {PD1@ff1p1v0c}   -rc_corner rcbest




#create_constraint_mode -name func -sdc_files $sdc 

#create_analysis_view -name func_setup_ss0p9v125c_rcworst -constraint_mode func -delay_corner setup_rcworst
#create_analysis_view -name func_hold_ff1p1v0c_rcbest     -constraint_mode func -delay_corner hold_rcbest

set_analysis_view -setup func_setup_ss0p9v_125c_rcworst -hold func_hold_ff1p1v_0c_rcbest

