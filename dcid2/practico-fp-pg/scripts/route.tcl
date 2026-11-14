setNanoRouteMode -route_with_timing_driven true
setNanoRouteMode -route_with_si_driven true
setNanoRouteMode -route_detail_use_multi_cut_via_effort medium; #{medium | high}

#Eexecute the route
# It runs SMART routing by default; that is, it runs in both timing- and signal integrity-driven mode by default. The other routing commands are not timing- or signal-integrity driven by default, but you can use the following setNanoRouteMode parameters to turn on timing- and signal-integrity-driven routing for those commands:
#	-route_with_timing_driven true
#	-route_with_si_driven true
# It changes the status of clock nets from FIXED to ROUTED so it can modify them during routing and routes them before routing other nets. Once the status of the clock nets is set to ROUTED, it does not change it back  to FIXED.
# To keep clock nets' status FIXED, run the following command before running routeDesign:
#	setNanoRouteMode -route_fix_clock_nets true
# To stop the router from routing clock nets first, run the following command before running routeDesign:
#	setNanoRouteMode -route_route_clock_nets_first false
# It runs a placement check prior to routing to ensure that the placement is clean. To turn off the placement check, specify the routeDesign -noPlacementCheck parameter.
# It checks for conflicts in setNanoRouteMode settings and issues warning messages when it detects problems. In some cases, it resets a mode in order to continue processing. For example, trying to fix postroute lithography problems and optimize vias concurrently can cause conflicts. If routeDesign detects requests for both types of operation, it issues a warning, turns off via optimization, and proceeds with fixing lithography problems.
# It has parameters that simplify via and wire optimization after routing. In addition, some setNanoRouteMode parameters work with routeDesign, but not with other routing commands.
# The routeDesign options for via and wire optimization are -viaOpt and -wireOpt.
#The setNanoRouteMode parameters that work only with routeDesign are -route_fix_clock_nets and -route_route_clock_nets_first.

routeDesign


#route_opt_design

#these are controlled by setNanorouteMode and attribute
#globalRoute

# via optimization
setNanoRouteMode -route_detail_min_slack_for_opt_wire 0
#setNanoRouteMode -route_concurrent_minimize_via_count_effort
#setNanoRouteMode -route_concurrent_minimize_via_count_effort value ; #for via reduction

setNanoRouteMode -route_detail_use_multi_cut_via_effort high


setNanoRouteMode -route_with_timing_driven false ; #turn off the timing driven to increase multicut swaping
setNanoRouteMode -route_detail_post_route_swap_via multiCut ; #to swap single cut to multicut


routeDesign -viaOpt


# Antena fixes

setNanoRouteMode -route_detail_fix_antenna true
setNanoRouteMode -route_antenna_cell_name "ANTENNA"
setNanoRouteMode -route_antenna_diode_insertion true

#detailRoute
globalDetailRoute
#globalNetConnect ; # to connect all new cells in the design logically to power and ground


# add filler cells
addFiller -cell FILL8LVT FILL64LVT FILL4LVT FILL32LVT FILL2LVT FILL16LVT FILL1LVT FILL8 FILL64 FILL4 FILL32 FILL2 FILL16 FILL1 DECAP10 -prefix FILLER -powerDomain VDD -doDRC -fitGap

# ecoroute after fill insertion
ecoRoute -target


