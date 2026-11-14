set stage "floorplan"
set cpu(cpu_num) 8
setPreference CmdLogMode 2

source ./scripts/conf_innovus.tcl
source ./scripts/library_setup.tcl

# set initialization values for innovus
set init_verilog $synth_netlist 
set init_mmmc_file $mmmc_file
set init_lef_file $lef(lef_files)
set init_top_cell $design
set init_gnd_net $ground_nets
set init_pwr_net $power_nets
set init_gds_map $gds_map_file
set init_design_uniquify 0

#suspend
init_design

setMultiCpuUsage -localCPU $cpu(cpu_num)

#setRouteMode -maxRouteLayer $max_route_layer
setDesignMode -topRoutingLayer $max_route_layer
#setRouteMode -minRouteLayer $min_route_layer
setDesignMode -bottomRoutingLayer $min_route_layer
setDesignMode -flowEffort standar -process 45
set fpgOddEvenSiteHeightConstraint 2
set fpgOddEvenSiteRowConstraint 2

#initialize floorplan
#set design_width  140
set design_width  200
set design_height 103.64
#set design_height 177.84
set core2edge_lr  2
set core2edge_tb  1.71


floorplan	-site CoreSite \
		-coreMarginsBy die \
		-d $design_width $design_height $core2edge_lr $core2edge_tb $core2edge_lr $core2edge_tb \
		-flip f

# track creation

add_tracks \
	-pitch_pattern {Metal1 offset 0.19 pitch 0.19 Metal3 offset 0.19 pitch 0.19 Metal5 offset 0.19 pitch 0.19} \
	-offset {Metal1 horiz 0.095 Metal2 vert 0.095 Metal3 horiz 0.1 Metal4 vert 0.095 Metal5 horiz 0.1 Metal6 vert 0.095 Metal7 horiz 0.1 Metal8 vert 0.095 Metal9 horiz 0.1 Metal10 vert 0.95 Metal11 horiz 0.6}

# globalNetConnect 

globalNetConnect VDD -type pgpin -pin VDD -inst * -override -verbose -autoTie
globalNetConnect VSS -type pgpin -pin VSS -inst * -override -verbose -autoTie

# Optimize buffer tree

deleteBufferTree

# port placement

if { [file exist $pin_file] } {
    #source $pin_file
    loadPtnPin -file $pin_file -all
} else {
    suspend
    savePtnPin -design pinfile
}

# Changing pins status to fixed

set_db ports .place_status fixed

# create power grid
source ./scripts/do_mygrid3.tcl


suspend
