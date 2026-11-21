

#settings configuration
setPlaceMode -place_detail_wire_length_opt_effort medium
setPlaceMode -place_global_clock_gate_aware true
setPlaceMode -place_global_clock_power_driven true
setPlaceMode -place_global_cong_effort auto
#setPlaceMode -place_global_goup_flop_to_macro true
#setPlaceMode -place_global_group_flop_to_macro_level 1
#setPlaceMode -place_global_group_flop_to_macrop_list <macro_list>
setPlaceMode -place_global_ignore_scan true
setPlaceMode -place_global_max_density -1
setPlaceMode -place_global_solver_effort high
setPlaceMode -place_global_timing_effort medium
setPlaceMode -place_global_uniform_density false

# add blockages - Modifique las coordenadas de lso bloqueos segun su caso
createPlaceBlockage -box {2.0 1.71 31.4 100.89} -type soft
createPlaceBlockage -box {168.8 1.71 198.2 100.89} -type hard


# place opt command
place_opt_design

#add tie hi/lo cells with max fanbout of 10
setTieHiLoMode -maxfanout 10
addTieHiLo -cell TIEHILVT -createHierPort true -powerDomain VDD
addTieHiLo -cell TIELOLVT -createHierPort true -powerDomain VSS


