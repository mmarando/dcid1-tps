# ####################################################################

#  Created by Genus(TM) Synthesis Solution 23.10-p004_1 on Wed Sep 30 22:28:08 -03 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design practico_3

create_clock -name "ck" -period 1.5 -waveform {0.0 0.75} [get_ports i_ck]
set_clock_gating_check -setup 0.0 
