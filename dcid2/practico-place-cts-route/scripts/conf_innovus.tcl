# basic configuration
set cpu(cpu_num) 8

set synth_netlist "/home/mmarando/dcid-tps/dcid2/practico-fp-pg/dataout/fir_serial_parallel_m.v"
set sdc           "/home/mmarando/dcid-tps/dcid2/practico-fp-pg/dataout/fir_serial_parallel_m.sdc"
set design        "fir_serial_parallel"
set mmmc_file     "./scripts/mmmc_invs.tcl"
set gds_map_file  "/home/amslib/PDKs/gpdk045v6/soce/streamOut.map"
set ground_nets   "VSS"
set power_nets    "VDD"
set max_route_layer 11
set min_route_layer 2
set pin_file      "./scripts/pinfile"
