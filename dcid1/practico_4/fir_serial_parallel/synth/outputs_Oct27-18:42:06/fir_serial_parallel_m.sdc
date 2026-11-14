# ####################################################################

#  Created by Genus(TM) Synthesis Solution 23.10-p004_1 on Tue Oct 27 18:43:55 -03 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design fir_serial_parallel

create_clock -name "clock" -period 1.2 -waveform {0.0 0.6} [get_ports i_clock]
create_generated_clock -name "clk_div4" -divide_by 4     -source [get_ports i_clock]   [get_pins gen_clock_reg/Q] 
group_path -name cg_enable_group_clock -through [list \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports i_reset]
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
