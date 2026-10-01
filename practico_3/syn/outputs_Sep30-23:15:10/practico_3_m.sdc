# ####################################################################

#  Created by Genus(TM) Synthesis Solution 23.10-p004_1 on Wed Sep 30 23:15:31 -03 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design practico_3

create_clock -name "ck" -period 1.5 -waveform {0.0 0.75} [get_ports i_ck]
create_generated_clock -name "ck_mux_direct" -add -divide_by 1     -source [get_ports i_ck]  -master_clock [get_clocks ck] [get_pins u_mux/o_ck] 
set_clock_gating_check -setup 0.0 
