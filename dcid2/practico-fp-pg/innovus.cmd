#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Sat Nov 14 00:42:11 2026                
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
zoomBox -0.02500 -0.01700 0.13100 0.12200
zoomBox -0.01500 -0.00800 0.11700 0.11000
zoomBox -0.16500 -0.13000 0.19000 0.18700
setPreference CmdLogMode 2
set init_verilog /home/mmarando/dcid-tps/dcid2/practico-fp-pg/dataout/fir_serial_parallel_m.v
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
floorPlan -site CoreSite -coreMarginsBy die -d 200 103.64 2 1.71 2 1.71 -flip f
add_tracks -pitch_pattern {Metal1 offset 0.19 pitch 0.19 Metal3 offset 0.19 pitch 0.19 Metal5 offset 0.19 pitch 0.19} -offset {Metal1 horiz 0.095 Metal2 vert 0.095 Metal3 horiz 0.1 Metal4 vert 0.095 Metal5 horiz 0.1 Metal6 vert 0.095 Metal7 horiz 0.1 Metal8 vert 0.095 Metal9 horiz 0.1 Metal10 vert 0.95 Metal11 horiz 0.6}
globalNetConnect VDD -type pgpin -pin VDD -inst * -override -verbose -autoTie
globalNetConnect VSS -type pgpin -pin VSS -inst * -override -verbose -autoTie
deleteBufferTree
loadPtnPin -file ./scripts/pinfile -all
setSrouteMode -connectBrokenCorePin true
sroute -connect corePin
setAddStripeMode -skip_via_on_pin {block cover pad physicalpin standardcell}
setAddStripeMode -skip_via_on_wire_shape {blockring blockwire corewire fillwire followpin iowire noshape padring ring stripe}
setAddStripeMode -stapling_shift false
setAddStripeMode -use_exact_spacing true
setAddStripeMode -remove_floating_stapling false
select_obj {special_wire:0x7f000eec1280 special_wire:0x7f000eec12b0 special_wire:0x7f000eec12e0 special_wire:0x7f000eec1310 special_wire:0x7f000eec1340 special_wire:0x7f000eec1370 special_wire:0x7f000eec13a0 special_wire:0x7f000eec13d0 special_wire:0x7f000eec1400 special_wire:0x7f000eec1430 special_wire:0x7f000eec1460 special_wire:0x7f000eec1490 special_wire:0x7f000eec14c0 special_wire:0x7f000eec14f0 special_wire:0x7f000eec1520 special_wire:0x7f000eec1550 special_wire:0x7f000eec1580 special_wire:0x7f000eec15b0 special_wire:0x7f000eec15e0 special_wire:0x7f000eec1610 special_wire:0x7f000eec1640 special_wire:0x7f000eec1670 special_wire:0x7f000eec16a0 special_wire:0x7f000eec16d0 special_wire:0x7f000eec1700 special_wire:0x7f000eec1730 special_wire:0x7f000eec1760 special_wire:0x7f000eec1790 special_wire:0x7f000eec17c0 special_wire:0x7f000eec17f0 special_wire:0x7f000eec1820 special_wire:0x7f000eec1850 special_wire:0x7f000eec1880 special_wire:0x7f000eec18b0 special_wire:0x7f000eec18e0 special_wire:0x7f000eec1910 special_wire:0x7f000eec1940 special_wire:0x7f000eec1970 special_wire:0x7f000eec19a0 special_wire:0x7f000eec19d0 special_wire:0x7f000eec1a00 special_wire:0x7f000eec1a30 special_wire:0x7f000eec1a60 special_wire:0x7f000eec1a90 special_wire:0x7f000eec1ac0 special_wire:0x7f000eec1af0 special_wire:0x7f000eec1b20 special_wire:0x7f000eec1b50 special_wire:0x7f000eec1b80 special_wire:0x7f000eec1bb0 special_wire:0x7f000eec1be0 special_wire:0x7f000eec1c10 special_wire:0x7f000eec1c40 special_wire:0x7f000eec1c70 special_wire:0x7f000eec1ca0 special_wire:0x7f000eec1cd0 special_wire:0x7f000eec1d00 special_wire:0x7f000eec1d30 special_wire:0x7f000eec1d60}
deleteSelectedFromFPlan
addStripe -nets VDD -layer Metal1 -direction horizontal -width 0.12 -spacing 3.42 -start 1.65 -set_to_set_distance 3.42 -switch_layer_over_obs false -snap_wire_center_to_grid Grid -use_wire_group 1 -use_wire_group_bits 1 -stop 105.26
addStripe -nets VSS -layer Metal1 -direction horizontal -width 0.12 -spacing 3.42 -start 3.36 -set_to_set_distance 3.42 -switch_layer_over_obs false -snap_wire_center_to_grid Grid -use_wire_group 1 -use_wire_group_bits 1 -stop 103.55
addStripe -nets VDD -stapling {0.880 1.80 3.42:1 Metal3} -layer Metal2 -width 0.16 -set_to_set_distance 3.42 -start 2.695 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
addStripe -nets VSS -stapling {0.880 3.51 3.42:1 Metal3} -layer Metal2 -width 0.16 -set_to_set_distance 3.42 -start 3.36 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via1
editPowerVia -add_vias 1 -bottom_layer Metal1 -top_layer Metal2
addStripe -nets VDD -stapling {0.880 2.90 3.42:1 Metal3} -layer Metal3 -direction horizontal -width 0.16 -set_to_set_distance 3.42 -start 1.45 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 101.84}
addStripe -nets VSS -stapling {0.880 3.51 3.42:1 Metal3} -layer Metal3 -direction horizontal -width 0.16 -set_to_set_distance 3.42 -start 3.36 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 101.84}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via2
editPowerVia -add_vias 1 -bottom_layer Metal2 -top_layer Metal3
addStripe -nets VDD -stapling {1.76 1.80 3.42:1 Metal4} -layer Metal4 -width 0.16 -set_to_set_distance 3.42 -start 2.695 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
addStripe -nets VSS -stapling {1.76 3.51 3.42:1 Metal4} -layer Metal4 -width 0.16 -set_to_set_distance 3.42 -start 3.36 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via3
editPowerVia -add_vias 1 -bottom_layer Metal3 -top_layer Metal4
addStripe -nets VDD -layer Metal5 -direction horizontal -width 0.16 -set_to_set_distance 3.42 -start 1.45 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
addStripe -nets VSS -layer Metal5 -direction horizontal -width 0.16 -set_to_set_distance 3.42 -start 3.15 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via4
editPowerVia -add_vias 1 -bottom_layer Metal4 -top_layer Metal5
addStripe -nets VDD -layer Metal6 -direction vertical -width 0.32 -set_to_set_distance 6.6 -start 2.5 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
addStripe -nets VSS -layer Metal6 -direction vertical -width 0.32 -set_to_set_distance 6.6 -start 4.2 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via5
editPowerVia -add_vias 1 -bottom_layer Metal5 -top_layer Metal6
addStripe -nets VDD -layer Metal7 -direction horizontal -width 0.32 -set_to_set_distance 6.6 -start 2 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
addStripe -nets VSS -layer Metal7 -direction horizontal -width 0.32 -set_to_set_distance 6.6 -start 3.7 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via6
editPowerVia -add_vias 1 -bottom_layer Metal6 -top_layer Metal7
addStripe -nets VDD -layer Metal8 -direction vertical -width 0.32 -set_to_set_distance 6.6 -start 2.5 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
addStripe -nets VSS -layer Metal8 -direction vertical -width 0.32 -set_to_set_distance 6.6 -start 4.2 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via7
editPowerVia -add_vias 1 -bottom_layer Metal7 -top_layer Metal8
addStripe -nets VDD -layer Metal9 -direction horizontal -width 0.32 -set_to_set_distance 6.6 -start 2 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
addStripe -nets VSS -layer Metal9 -direction horizontal -width 0.32 -set_to_set_distance 6.6 -start 3.7 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via8
editPowerVia -add_vias 1 -bottom_layer Metal8 -top_layer Metal9
addStripe -nets VDD -layer Metal10 -direction vertical -width 0.32 -set_to_set_distance 7 -start 5 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
addStripe -nets VSS -layer Metal10 -direction vertical -width 0.32 -set_to_set_distance 7 -start 6.7 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via9
editPowerVia -add_vias 1 -bottom_layer Metal9 -top_layer Metal10
addStripe -nets VDD -layer Metal11 -direction horizontal -width 0.475 -set_to_set_distance 7 -start 4 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
addStripe -nets VSS -layer Metal11 -direction horizontal -width 0.475 -set_to_set_distance 7 -start 5.7 -snap_wire_center_to_grid Grid -switch_layer_over_obs false -area_blockage {198.0 0.0 200.0 103.55}
setViaGenMode -reset
setViaGenMode -extend_out_wire_end false
setViaGenMode -allow_via_expansion false
setViaGenMode -viarule_preference Via10
editPowerVia -add_vias 1 -bottom_layer Metal10 -top_layer Metal11
zoomBox -58.53050 -47.06000 187.79600 172.74900
zoomBox -2.42050 3.18200 126.16400 117.92400
zoomBox -6.58450 -23.52950 171.38750 135.28350
zoomBox -50.76150 -110.33600 290.17700 193.89950
zoomBox -21.06550 -54.13400 225.26250 165.67600
uiSetTool ruler
zoomBox -1.88200 -11.89000 149.39500 123.10150
zoomBox 0.76750 18.01550 93.67050 100.91750
zoomBox 3.58900 45.08550 52.08500 88.36100
zoomBox 6.07300 61.84650 27.59100 81.04800
zoomBox 7.06100 68.23700 18.29300 78.26000
zoomBox 8.46050 72.01250 13.44500 76.46050
uiSetTool ruler
uiSetTool select
selectWire 9.1350 1.7100 9.4550 101.8400 6 VDD
deselectAll
selectWire 9.1350 1.7100 9.4550 101.8400 6 VDD
setLayerPreference Poly -isVisible 0
setLayerPreference Poly -isVisible 1
setLayerPreference Poly -isSelectable 0
setLayerPreference Poly -isSelectable 1
zoomBox 7.96050 71.64300 13.82500 76.87600
zoomBox 4.90800 69.01900 18.12650 80.81450
zoomBox -0.11550 64.71700 25.20700 87.31350
setLayerPreference node_layer -isSelectable 0
setLayerPreference node_layer -isSelectable 1
setLayerPreference node_layer -isVisible 0
setLayerPreference node_layer -isVisible 1
zoomBox -1.82450 61.75400 33.22450 93.03000
zoomBox -1.06350 66.50750 20.46100 85.71500
zoomBox -0.49000 70.12300 10.74650 80.15000
zoomBox -0.24900 71.64700 6.65200 77.80500
zoomBox -0.14250 72.32000 4.84350 76.76900
zoomBox -1.61950 72.65250 2.61900 76.43450
pan -2.62600 72.78400
zoomBox -1.06850 73.73250 0.81300 75.41150
zoomBox -3.10100 72.45250 1.88900 76.90550
zoomBox -8.55450 69.11900 4.67850 80.92750
pan 1.95700 71.15150
pan 0.82400 61.28200
zoomBox -11.58450 48.46200 18.24100 75.07650
zoomBox -13.50300 47.05550 21.58600 78.36700
zoomBox -5.36750 50.05400 7.86650 61.86350
zoomBox -2.36700 50.52100 3.50600 55.76200
deselectAll
zoomBox -7.77650 44.89350 7.79800 58.79150
checkFPlan -reportUtil
help base_cell
