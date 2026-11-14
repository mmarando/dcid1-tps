
set netlist "./dataout/fir_serial_parallel_m.v"
set sdc     "./dataout/fir_serial_parallel_m.sdc"

read_mmmc ./scripts/mmmc_invs.tcl

read_physical -lef {/home/amslib/PDKs/gpdk045v6/gsclib045_tech/lef/gsclib045_tech.lef \
                    /home/amslib/PDKs/gpdk045v6/gsclib045_hvt/lef/gsclib045_hvt_macro.lef \
                    /home/amslib/PDKs/gpdk045v6/gsclib045/lef/gsclib045_macro.lef \
                    /home/amslib/PDKs/gpdk045v6/gsclib045_lvt/lef/gsclib045_lvt_macro.lef  } 

read_netlist $netlist

init_design

