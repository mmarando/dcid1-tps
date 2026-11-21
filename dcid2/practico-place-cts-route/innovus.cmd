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
