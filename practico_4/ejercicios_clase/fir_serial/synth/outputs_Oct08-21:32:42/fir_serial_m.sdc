# ####################################################################

#  Created by Genus(TM) Synthesis Solution 23.10-p004_1 on Thu Oct 08 21:33:21 -03 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design fir_serial

create_clock -name "clock" -period 1.8 -waveform {0.0 0.9} [get_ports i_clock]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[0]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[18]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[17]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[16]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[15]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[14]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[13]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[12]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[11]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[10]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[9]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[8]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[7]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[6]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[5]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[4]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[3]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[2]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[1]}]
set_output_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {o_data[0]}]
