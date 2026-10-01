# ####################################################################

#  Created by Genus(TM) Synthesis Solution 23.10-p004_1 on Wed Sep 30 23:09:47 -03 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design practico_3

create_clock -name "ck" -period 1.5 -waveform {0.0 0.75} [get_ports i_ck]
create_generated_clock -name "ck_div2" -divide_by 2     -source [get_ports i_ck]   [get_pins u_div2_r_div_reg/Q] 
create_generated_clock -name "ck_div4" -divide_by 4     -source [get_ports i_ck]   [get_pins {u_div4_r_count_reg[1]/Q}] 
create_generated_clock -name "ck_mux_div2" -add -divide_by 1     -source [get_pins u_mux/i_b]  -master_clock [get_clocks ck_div2] [get_pins u_mux/o_ck] 
create_generated_clock -name "ck_mux_div4" -add -divide_by 1     -source [get_pins u_mux/i_c]  -master_clock [get_clocks ck_div4] [get_pins u_mux/o_ck] 
set_clock_gating_check -setup 0.0 
