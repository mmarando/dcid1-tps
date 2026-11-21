#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Sat Nov 21 15:25:55 2026                
#                                                     
#######################################################

#@(#)CDS: Innovus v23.10-p003_1 (64bit) 02/01/2024 13:54 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 23.10-p003_1 NR240109-1512/23_10-UB (database version 18.20.618) {superthreading v2.20}
#@(#)CDS: AAE 23.10-p002 (64bit) 02/01/2024 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 23.10-p003_1 () Dec  5 2023 19:42:23 ( )
#@(#)CDS: SYNTECH 23.10-p002_1 () Nov 29 2023 02:17:21 ( )
#@(#)CDS: CPE v23.10-p004
#@(#)CDS: IQuantus/TQuantus 22.1.1-s215 (64bit) Mon Nov 20 10:05:08 PST 2023 (Linux 3.10.0-693.el7.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
setPreference CmdLogMode 2
set init_verilog /home/mmarando/dcid-tps/dcid2/practico-place-cts-route/dataout/fir_serial_parallel_m.v
set init_mmmc_file ./scripts/mmmc_invs.tcl
set init_lef_file {/home/amslib/PDKs/gpdk045v6/gsclib045_tech/lef/gsclib045_tech.lef /home/amslib/PDKs/gpdk045v6/gsclib045_hvt/lef/gsclib045_hvt_macro.lef /home/amslib/PDKs/gpdk045v6/gsclib045/lef/gsclib045_macro.lef /home/amslib/PDKs/gpdk045v6/gsclib045_lvt/lef/gsclib045_lvt_macro.lef}
set init_top_cell fir_serial_parallel
set init_gnd_net VSS
set init_pwr_net VDD
set init_design_uniquify 0
init_design
setMultiCpuUsage -localCPU 8
setDesignMode -topRoutingLayer 11
setDesignMode -bottomRoutingLayer 2
setDesignMode -flowEffort standar -process 45
floorPlan -site CoreSite -coreMarginsBy die -d 200.20 102.60 2 1.71 2 1.71 -flip f
add_tracks -pitch_pattern {Metal1 offset 0.19 pitch 0.19 Metal3 offset 0.19 pitch 0.19 Metal5 offset 0.19 pitch 0.19} -offset {Metal1 horiz 0.095 Metal2 vert 0.095 Metal3 horiz 0.1 Metal4 vert 0.095 Metal5 horiz 0.1 Metal6 vert 0.095 Metal7 horiz 0.1 Metal8 vert 0.095 Metal9 horiz 0.1 Metal10 vert 0.95 Metal11 horiz 0.6}
globalNetConnect VDD -type pgpin -pin VDD -inst * -override -verbose -autoTie
globalNetConnect VSS -type pgpin -pin VSS -inst * -override -verbose -autoTie
deleteBufferTree
editPin -pin {{i_data[7]} {i_data[6]} {i_data[5]} {i_data[4]} {i_data[3]} {i_data[2]} {i_data[1]} {i_data[0]}} -side LEFT -layer Metal5 -spreadType CENTER -spacing 2 -unit TRACK -snap TRACK -fixOverlap 1 -fixedPin 1
editPin -pin {{i_coeffs[0][7]} {i_coeffs[0][6]} {i_coeffs[0][5]} {i_coeffs[0][4]} {i_coeffs[0][3]} {i_coeffs[0][2]} {i_coeffs[0][1]} {i_coeffs[0][0]} {i_coeffs[1][7]} {i_coeffs[1][6]} {i_coeffs[1][5]} {i_coeffs[1][4]} {i_coeffs[1][3]} {i_coeffs[1][2]} {i_coeffs[1][1]} {i_coeffs[1][0]} {i_coeffs[2][7]} {i_coeffs[2][6]} {i_coeffs[2][5]} {i_coeffs[2][4]} {i_coeffs[2][3]} {i_coeffs[2][2]} {i_coeffs[2][1]} {i_coeffs[2][0]} {i_coeffs[3][7]} {i_coeffs[3][6]} {i_coeffs[3][5]} {i_coeffs[3][4]} {i_coeffs[3][3]} {i_coeffs[3][2]} {i_coeffs[3][1]} {i_coeffs[3][0]} {i_coeffs[4][7]} {i_coeffs[4][6]} {i_coeffs[4][5]} {i_coeffs[4][4]} {i_coeffs[4][3]} {i_coeffs[4][2]} {i_coeffs[4][1]} {i_coeffs[4][0]} {i_coeffs[5][7]} {i_coeffs[5][6]} {i_coeffs[5][5]} {i_coeffs[5][4]} {i_coeffs[5][3]} {i_coeffs[5][2]} {i_coeffs[5][1]} {i_coeffs[5][0]} {i_coeffs[6][7]} {i_coeffs[6][6]} {i_coeffs[6][5]} {i_coeffs[6][4]} {i_coeffs[6][3]} {i_coeffs[6][2]} {i_coeffs[6][1]} {i_coeffs[6][0]} {i_coeffs[7][7]} {i_coeffs[7][6]} {i_coeffs[7][5]} {i_coeffs[7][4]} {i_coeffs[7][3]} {i_coeffs[7][2]} {i_coeffs[7][1]} {i_coeffs[7][0]} i_reset} -side BOTTOM -layer Metal4 -spreadType CENTER -spacing 2 -unit TRACK -snap TRACK -fixOverlap 1 -fixedPin 1
editPin -pin i_clock -side RIGHT -layer Metal5 -spreadType CENTER -spacing 2 -unit TRACK -snap TRACK -fixOverlap 1 -fixedPin 1
editPin -pin {{o_data[18]} {o_data[17]} {o_data[16]} {o_data[15]} {o_data[14]} {o_data[13]} {o_data[12]} {o_data[11]} {o_data[10]} {o_data[9]} {o_data[8]} {o_data[7]} {o_data[6]} {o_data[5]} {o_data[4]} {o_data[3]} {o_data[2]} {o_data[1]} {o_data[0]}} -side TOP -layer Metal4 -spreadType CENTER -spacing 2 -unit TRACK -snap TRACK -fixOverlap 1 -fixedPin 1
checkPinAssignment -outFile reports/checkPin.rpt
savePtnPin -design scripts/pinfile
savePtnPin -design pinfile
setSrouteMode -connectBrokenCorePin true
sroute -connect corePin
setAddStripeMode -skip_via_on_pin {block cover pad physicalpin standardcell}
setAddStripeMode -skip_via_on_wire_shape {blockring blockwire corewire fillwire followpin iowire noshape padring ring stripe}
setAddStripeMode -stapling_shift false
setAddStripeMode -use_exact_spacing true
setAddStripeMode -remove_floating_stapling false
select_obj {special_wire:0x7fe84f8ed280 special_wire:0x7fe84f8ed2b0 special_wire:0x7fe84f8ed2e0 special_wire:0x7fe84f8ed310 special_wire:0x7fe84f8ed340 special_wire:0x7fe84f8ed370 special_wire:0x7fe84f8ed3a0 special_wire:0x7fe84f8ed3d0 special_wire:0x7fe84f8ed400 special_wire:0x7fe84f8ed430 special_wire:0x7fe84f8ed460 special_wire:0x7fe84f8ed490 special_wire:0x7fe84f8ed4c0 special_wire:0x7fe84f8ed4f0 special_wire:0x7fe84f8ed520 special_wire:0x7fe84f8ed550 special_wire:0x7fe84f8ed580 special_wire:0x7fe84f8ed5b0 special_wire:0x7fe84f8ed5e0 special_wire:0x7fe84f8ed610 special_wire:0x7fe84f8ed640 special_wire:0x7fe84f8ed670 special_wire:0x7fe84f8ed6a0 special_wire:0x7fe84f8ed6d0 special_wire:0x7fe84f8ed700 special_wire:0x7fe84f8ed730 special_wire:0x7fe84f8ed760 special_wire:0x7fe84f8ed790 special_wire:0x7fe84f8ed7c0 special_wire:0x7fe84f8ed7f0 special_wire:0x7fe84f8ed820 special_wire:0x7fe84f8ed850 special_wire:0x7fe84f8ed880 special_wire:0x7fe84f8ed8b0 special_wire:0x7fe84f8ed8e0 special_wire:0x7fe84f8ed910 special_wire:0x7fe84f8ed940 special_wire:0x7fe84f8ed970 special_wire:0x7fe84f8ed9a0 special_wire:0x7fe84f8ed9d0 special_wire:0x7fe84f8eda00 special_wire:0x7fe84f8eda30 special_wire:0x7fe84f8eda60 special_wire:0x7fe84f8eda90 special_wire:0x7fe84f8edac0 special_wire:0x7fe84f8edaf0 special_wire:0x7fe84f8edb20 special_wire:0x7fe84f8edb50 special_wire:0x7fe84f8edb80 special_wire:0x7fe84f8edbb0 special_wire:0x7fe84f8edbe0 special_wire:0x7fe84f8edc10 special_wire:0x7fe84f8edc40 special_wire:0x7fe84f8edc70 special_wire:0x7fe84f8edca0 special_wire:0x7fe84f8edcd0 special_wire:0x7fe84f8edd00 special_wire:0x7fe84f8edd30 special_wire:0x7fe84f8edd60}
deleteSelectedFromFPlan
addStripe -nets VDD -layer Metal1 -direction horizontal -width 0.12 -spacing 3.42 -start 1.65 -set_to_set_distance 3.42 -switch_layer_over_obs false -snap_wire_center_to_grid Grid -use_wire_group 1 -use_wire_group_bits 1 -stop 104.31
addStripe -nets VSS -layer Metal1 -direction horizontal -width 0.12 -spacing 3.42 -start 3.36 -set_to_set_distance 3.42 -switch_layer_over_obs false -snap_wire_center_to_grid Grid -use_wire_group 1 -use_wire_group_bits 1 -stop 102.6
addStripe -nets VDD -stapling {0.880 1.80 3.42:1 Metal3} -layer Metal2 -width 0.16 -set_to_set_distance 3.42 -start 2.695 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
addStripe -nets VSS -stapling {0.880 3.51 3.42:1 Metal3} -layer Metal2 -width 0.16 -set_to_set_distance 3.42 -start 3.36 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via1
editPowerVia -add_vias 1 -bottom_layer Metal1 -top_layer Metal2
addStripe -nets VDD -stapling {0.880 2.90 3.42:1 Metal3} -layer Metal3 -direction horizontal -width 0.16 -set_to_set_distance 3.42 -start 1.45 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 100.89}
addStripe -nets VSS -stapling {0.880 3.51 3.42:1 Metal3} -layer Metal3 -direction horizontal -width 0.16 -set_to_set_distance 3.42 -start 3.36 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 100.89}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via2
editPowerVia -add_vias 1 -bottom_layer Metal2 -top_layer Metal3
addStripe -nets VDD -stapling {1.76 1.80 3.42:1 Metal4} -layer Metal4 -width 0.16 -set_to_set_distance 3.42 -start 2.695 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
addStripe -nets VSS -stapling {1.76 3.51 3.42:1 Metal4} -layer Metal4 -width 0.16 -set_to_set_distance 3.42 -start 3.36 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via3
editPowerVia -add_vias 1 -bottom_layer Metal3 -top_layer Metal4
addStripe -nets VDD -layer Metal5 -direction horizontal -width 0.16 -set_to_set_distance 3.42 -start 1.45 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
addStripe -nets VSS -layer Metal5 -direction horizontal -width 0.16 -set_to_set_distance 3.42 -start 3.15 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via4
editPowerVia -add_vias 1 -bottom_layer Metal4 -top_layer Metal5
addStripe -nets VDD -layer Metal6 -direction vertical -width 0.32 -set_to_set_distance 6.6 -start 2.5 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
addStripe -nets VSS -layer Metal6 -direction vertical -width 0.32 -set_to_set_distance 6.6 -start 4.2 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via5
editPowerVia -add_vias 1 -bottom_layer Metal5 -top_layer Metal6
addStripe -nets VDD -layer Metal7 -direction horizontal -width 0.32 -set_to_set_distance 6.6 -start 2 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
addStripe -nets VSS -layer Metal7 -direction horizontal -width 0.32 -set_to_set_distance 6.6 -start 3.7 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via6
editPowerVia -add_vias 1 -bottom_layer Metal6 -top_layer Metal7
addStripe -nets VDD -layer Metal8 -direction vertical -width 0.32 -set_to_set_distance 6.6 -start 2.5 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
addStripe -nets VSS -layer Metal8 -direction vertical -width 0.32 -set_to_set_distance 6.6 -start 4.2 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via7
editPowerVia -add_vias 1 -bottom_layer Metal7 -top_layer Metal8
addStripe -nets VDD -layer Metal9 -direction horizontal -width 0.32 -set_to_set_distance 6.6 -start 2 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
addStripe -nets VSS -layer Metal9 -direction horizontal -width 0.32 -set_to_set_distance 6.6 -start 3.7 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via8
editPowerVia -add_vias 1 -bottom_layer Metal8 -top_layer Metal9
addStripe -nets VDD -layer Metal10 -direction vertical -width 0.32 -set_to_set_distance 7 -start 5 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
addStripe -nets VSS -layer Metal10 -direction vertical -width 0.32 -set_to_set_distance 7 -start 6.7 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via9
editPowerVia -add_vias 1 -bottom_layer Metal9 -top_layer Metal10
addStripe -nets VDD -layer Metal11 -direction horizontal -width 0.475 -set_to_set_distance 7 -start 4 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
addStripe -nets VSS -layer Metal11 -direction horizontal -width 0.475 -set_to_set_distance 7 -start 5.7 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.2 0.0 200.2 102.6}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via10
editPowerVia -add_vias 1 -bottom_layer Metal10 -top_layer Metal11
checkFPlan -reportUtil > reports/fp40/util.rpt
verify_drc > reports/fp40/drc_salida.rpt
verify_connectivity -type special -no_antenna -report reports/fp40/conectividad.rpt
saveDesign dataout/fp_40.enc
zoomBox 194 48 200 55
zoomBox 197.5 50.8 198.4 51.8
selectMarker 2.0000 1.7100 198.2000 100.8900 -1 3 7
deselectAll
selectMarker 198.0100 51.2200 198.2000 51.3800 -1 3 7
deselectAll
deselectAll
selectWire 198.010 51.220 198.200 51.380 3 VSS
deselectAll
fit
selectMarker 2.0000 1.7100 198.2000 100.8900 -1 3 7
deselectAll
selectWire 121.3350 1.7100 121.6550 100.8900 6 VDD
deselectAll
selectWire 2.0000 39.2700 198.2000 39.3900 1 VDD
deselectAll
selectWire 198.010 51.220 198.200 51.380 3 VSS
deleteSelectedFromFPlan
verify_drc > reports/fp40/drc_prueba_stub.rpt
verify_connectivity -type special -no_antenna -report reports/fp40/conn_prueba_stub.rpt
saveDesign dataout/fp_40_prueba_stub.enc
deselectAll
select_obj {special_wire:0x7fe803e540e0 special_wire:0x7fe803e195b0 special_wire:0x7fe803e18ad0 special_wire:0x7fe803fddfa0 special_wire:0x7fe803fdd4c0 special_wire:0x7fe803fdc9e0 special_wire:0x7fe803fa3eb0 special_wire:0x7fe803fa33d0 special_wire:0x7fe803fa28f0 special_wire:0x7fe803f65dc0 special_wire:0x7fe803f652e0 special_wire:0x7fe803f64800 special_wire:0x7fe803f27cd0 special_wire:0x7fe803f271f0 special_wire:0x7fe8040edbe0 special_wire:0x7fe8040ed100 special_wire:0x7fe8040ec620 special_wire:0x7fe8040b3af0 special_wire:0x7fe8040b3010 special_wire:0x7fe8040b2530 special_wire:0x7fe804077a00 special_wire:0x7fe804076f20 special_wire:0x7fe804076440 special_wire:0x7fe804037910 special_wire:0x7fe804036e30 special_wire:0x7fe804036350 special_wire:0x7fe8041a1820 special_wire:0x7fe8041a0d40}
deleteSelectedFromFPlan
verify_drc > reports/fp40/drc_sin_stubs.rpt
verify_connectivity -type special -no_antenna -report reports/fp40/conn_sin_stubs.rpt
saveDesign dataout/fp_40_sin_stubs.enc
gui_dump_picture
fit
gui_dump_picture reports/fp40/floorplan.png -format PNG
report_clocks > reports/fp40/clocks.rpt
get_time_unit
get_capacitance_unit
setPlaceMode -place_detail_wire_length_opt_effort medium
setPlaceMode -place_global_clock_gate_aware true
setPlaceMode -place_global_clock_power_driven true
setPlaceMode -place_global_cong_effort auto
setPlaceMode -place_global_ignore_scan true
setPlaceMode -place_global_max_density -1
setPlaceMode -place_global_solver_effort high
setPlaceMode -place_global_timing_effort medium
setPlaceMode -place_global_uniform_density true
place_opt_design
setTieHiLoMode -maxfanout 10
addTieHiLo -cell TIEHILVT -createHierPort true -powerDomain VDD
addTieHiLo -cell TIELOLVT -createHierPort true -powerDomain VSS
selectWire 61.4550 5.8500 67.3350 5.9300 3 u_fir_parallel_csa_tree_ADD_TC_OP_13_groupi_n_1589
setLayerPreference pinObj -isVisible 1
setLayerPreference pinObj -isVisible 0
setLayerPreference layoutObj -isVisible 1
setLayerPreference layoutObj -isVisible 0
setLayerPreference cellBlkgObj -isVisible 1
setLayerPreference cellBlkgObj -isVisible 0
setLayerPreference cellBlkgObj -isVisible 1
zoomBox -1.28550 7.22400 171.53050 88.76550
zoomBox 25.12500 25.11700 101.80550 61.29800
zoomBox 38.24450 34.00550 67.16650 47.65200
zoomBox 44.58600 37.38550 59.68450 44.50950
zoomBox 42.51050 35.17050 63.40850 45.03100
zoomBox 51.73750 38.47000 62.64700 43.61750
zoomBox 55.52000 39.77700 60.36250 42.06200
setLayerPreference node_module -isVisible 0
setLayerPreference node_module -isVisible 1
setLayerPreference node_module -isSelectable 0
setLayerPreference node_module -isSelectable 1
setLayerPreference node_module -isVisible 0
setLayerPreference node_module -isVisible 1
zoomBox 50.97150 37.96450 63.81100 44.02250
zoomBox 38.94000 33.15650 72.98750 49.22150
zoomBox 35.53150 31.79450 75.58750 50.69450
zoomBox -1.99900 16.80050 104.21150 66.91500
setLayerPreference node_module -isSelectable 0
setLayerPreference node_module -isSelectable 1
setLayerPreference node_module -isVisible 0
setLayerPreference node_module -isVisible 1
setLayerPreference Poly -isVisible 0
setLayerPreference Poly -isVisible 1
zoomBox 39.74500 37.25250 86.87200 59.48900
zoomBox 44.73600 39.69950 84.79400 58.60050
zoomBox 67.47300 49.42650 78.38900 54.57700
zoomBox 68.75050 49.97300 78.02900 54.35100
zoomBox 71.54350 51.16750 77.24200 53.85650
setLayerPreference Poly -isVisible 0
setLayerPreference Poly -isVisible 1
setLayerPreference Cont -isVisible 0
setLayerPreference Cont -isVisible 1
setLayerPreference Metal1 -isVisible 0
setLayerPreference Metal1 -isVisible 1
report_area > reports/ej1/area_post_place.rpt
verify_connectivity -type special -no_antenna -report reports/ej1/conn_post_place.rpt
deselectAll
selectInst u_fir_parallel_csa_tree_ADD_TC_OP_13_groupi_g2721__8246
fit
deselectAll
gui_dump_picture reports/ej1/placement.png -format PNG
saveDesign dataout/ej1_place.enc
checkFPlan -reportUtil > reports/ej1/util_post_place.rpt
checkPlace > reports/ej1/check_place.rpt
refinePlace > reports/ej1/refine_place.rpt
checkPlace > reports/ej1/check_place_refinado.rpt
checkFPlan -reportUtil > reports/ej1/util_post_refine.rpt
report_timing -late -path_type summary_slack_only -max_paths 50 > reports/ej1/setup_post_refine.rpt
verify_connectivity -type special -no_antenna -report reports/ej1/conn_post_refine.rpt
saveDesign dataout/ej1_place_refinado.enc
set_ccopt_property inverter_cells {CLKINVX2LVT CLKINVX4LVT CLKINVX8LVT}
set_ccopt_property buffer_cells {CLKBUFX2LVT CLKBUFX4LVT CLKBUFX8LVT}
set_ccopt_property clock_gating_cells {TLATNTSCAX2LVT TLATNTSCAX4LVT}
set_ccopt_property logic_cells {CLKAND2X2LVT CLKMX2X2LVT CLKXOR2X2LVT}
set_ccopt_property use_inverters true
set_ccopt_property target_skew 0.100
set_ccopt_property target_max_trans 0.080
set_ccopt_property -net_type trunk target_max_trans 0.080
set_ccopt_property -net_type leaf target_max_trans 0.080
set_ccopt_property target_max_trans -net_type top 0.08
set_ccopt_property target_max_trans -net_type trunk 0.08
set_ccopt_property size_logic true
set_ccopt_property post_conditioning_enable_drv_fixing true
set_ccopt_property post_conditioning_enable_drv_fixing_by_rebuffering true
set_ccopt_property post_conditioning_enable_skew_fixing true
set_ccopt_property post_conditioning_enable_skew_fixing_by_rebuffering true
set_ccopt_property allow_resize_of_dont_touch_cells false
set_ccopt_property clone_clock_gates true
set_ccopt_property merge_clock_gates true
set_ccopt_property merge_clock_logic true
add_ndr -name trunk_ndr_2xw_2xs -width {Metal9 0.16 Metal10 0.44 Metal11 0.44} -spacing {Metal9 0.14 Metal10 0.4 Metal11 0.4} -via {{M11_M10_2x1_VH_E} {M11_M10_2x1_VH_W} {M11_M10_1x2_VH_N} {M11_M10_1x2_VH_S}  {M10_M9_2x1_HV_E} {M10_M9_2x1_HV_W} {M10_M9_1x2_HV_N} {M10_M9_1x2_HV_S}  {M9_M8_2x1_VH_E} {M9_M8_2x1_HV_W} {M9_M8_1x2_HV_N} {M9_M8_1x2_HV_S} }
add_ndr -name leaf_ndr_2xw_2xs -width {Metal1 0.12  Metal2 0.16 Metal3 0.16 Metal4 0.16 Metal5 0.16 Metal6 0.16 Metal7 0.16 Metal8 0.16} -spacing {Metal1 0.12 Metal2 0.14 Metal3 0.14 Metal4 0.14 Metal5 0.14 Metal6 0.14 Metal7 0.14 Metal8 0.14} -via {{M2_M1_2x1_HV_E} {M2_M1_2x1_HV_W} {M2_M1_1x2_HV_N} {M2_M1_1x2_HV_S}  {M3_M2_2x1_VH_E} {M3_M2_2x1_HV_W} {M3_M2_1x2_HV_N} {M3_M2_1x2_HV_S}  {M4_M3_2x1_VH_E} {M4_M3_2x1_HV_W} {M4_M3_1x2_HV_N} {M4_M3_1x2_HV_S}  {M5_M4_2x1_VH_E} {M5_M4_2x1_HV_W} {M5_M4_1x2_HV_N} {M5_M4_1x2_HV_S}  {M6_M5_2x1_VH_E} {M6_M5_2x1_HV_W} {M6_M5_1x2_HV_N} {M6_M5_1x2_HV_S}  {M7_M6_2x1_VH_E} {M7_M6_2x1_HV_W} {M7_M6_1x2_HV_N} {M7_M6_1x2_HV_S}  {M8_M7_2x1_VH_E} {M8_M7_2x1_HV_W} {M8_M7_1x2_HV_N} {M8_M7_1x2_HV_S} }
create_route_type -name clock_trunk_ndr -top_preferred_layer 11 -bottom_preferred_layer 8 -preferred_routing_layer_effort high -non_default_rule trunk_ndr_2xw_2xs -min_stack_layer 4
create_route_type -name clock_leaf_ndr -top_preferred_layer 8 -bottom_preferred_layer 2 -preferred_routing_layer_effort high -non_default_rule leaf_ndr_2xw_2xs -min_stack_layer 4
set_ccopt_property route_type clock_trunk_ndr -net_type trunk
set_ccopt_property route_type -net_type leaf clock_leaf_ndr
set_ccopt_property route_type_override_preferred_routing_layer_effort none
clock_opt_design
checkPlace > reports/ej1/check_place_post_cts.rpt
report_timing -late -path_type summary_slack_only -max_paths 50 > reports/ej1/setup_post_cts.rpt
report_timing -early -path_type summary_slack_only -max_paths 50 > reports/ej1/hold_post_cts.rpt
report_ccopt_skew_groups -histograms -summary > reports/ej1/skew_groups_post_cts.rpt
verify_connectivity -type special -no_antenna -report reports/ej1/conn_post_cts.rpt
saveDesign dataout/ej1_cts.enc
