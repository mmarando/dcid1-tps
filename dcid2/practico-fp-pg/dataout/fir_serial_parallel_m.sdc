# ####################################################################

#  Created by Genus(TM) Synthesis Solution 23.10-p004_1 on Tue Oct 07 21:34:05 -03 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design fir_serial_parallel

#create_clock -name "clock" -period 1.5 -waveform {0.0 0.75} [get_ports i_clock]
create_clock -name "clock" -period 1.2 [get_ports i_clock]
create_generated_clock -name "clk_div2" -divide_by 2     -source [get_ports i_clock]   [get_pins gen_clock_reg/Q] 
group_path -name cg_enable_group_clock -through [list \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E] ]
set_false_path -from [list \
  [get_ports {i_coeffs[0][7]}]  \
  [get_ports {i_coeffs[0][6]}]  \
  [get_ports {i_coeffs[0][5]}]  \
  [get_ports {i_coeffs[0][4]}]  \
  [get_ports {i_coeffs[0][3]}]  \
  [get_ports {i_coeffs[0][2]}]  \
  [get_ports {i_coeffs[0][1]}]  \
  [get_ports {i_coeffs[0][0]}]  \
  [get_ports {i_coeffs[1][7]}]  \
  [get_ports {i_coeffs[1][6]}]  \
  [get_ports {i_coeffs[1][5]}]  \
  [get_ports {i_coeffs[1][4]}]  \
  [get_ports {i_coeffs[1][3]}]  \
  [get_ports {i_coeffs[1][2]}]  \
  [get_ports {i_coeffs[1][1]}]  \
  [get_ports {i_coeffs[1][0]}]  \
  [get_ports {i_coeffs[2][7]}]  \
  [get_ports {i_coeffs[2][6]}]  \
  [get_ports {i_coeffs[2][5]}]  \
  [get_ports {i_coeffs[2][4]}]  \
  [get_ports {i_coeffs[2][3]}]  \
  [get_ports {i_coeffs[2][2]}]  \
  [get_ports {i_coeffs[2][1]}]  \
  [get_ports {i_coeffs[2][0]}]  \
  [get_ports {i_coeffs[3][7]}]  \
  [get_ports {i_coeffs[3][6]}]  \
  [get_ports {i_coeffs[3][5]}]  \
  [get_ports {i_coeffs[3][4]}]  \
  [get_ports {i_coeffs[3][3]}]  \
  [get_ports {i_coeffs[3][2]}]  \
  [get_ports {i_coeffs[3][1]}]  \
  [get_ports {i_coeffs[3][0]}]  \
  [get_ports {i_coeffs[4][7]}]  \
  [get_ports {i_coeffs[4][6]}]  \
  [get_ports {i_coeffs[4][5]}]  \
  [get_ports {i_coeffs[4][4]}]  \
  [get_ports {i_coeffs[4][3]}]  \
  [get_ports {i_coeffs[4][2]}]  \
  [get_ports {i_coeffs[4][1]}]  \
  [get_ports {i_coeffs[4][0]}]  \
  [get_ports {i_coeffs[5][7]}]  \
  [get_ports {i_coeffs[5][6]}]  \
  [get_ports {i_coeffs[5][5]}]  \
  [get_ports {i_coeffs[5][4]}]  \
  [get_ports {i_coeffs[5][3]}]  \
  [get_ports {i_coeffs[5][2]}]  \
  [get_ports {i_coeffs[5][1]}]  \
  [get_ports {i_coeffs[5][0]}]  \
  [get_ports {i_coeffs[6][7]}]  \
  [get_ports {i_coeffs[6][6]}]  \
  [get_ports {i_coeffs[6][5]}]  \
  [get_ports {i_coeffs[6][4]}]  \
  [get_ports {i_coeffs[6][3]}]  \
  [get_ports {i_coeffs[6][2]}]  \
  [get_ports {i_coeffs[6][1]}]  \
  [get_ports {i_coeffs[6][0]}]  \
  [get_ports {i_coeffs[7][7]}]  \
  [get_ports {i_coeffs[7][6]}]  \
  [get_ports {i_coeffs[7][5]}]  \
  [get_ports {i_coeffs[7][4]}]  \
  [get_ports {i_coeffs[7][3]}]  \
  [get_ports {i_coeffs[7][2]}]  \
  [get_ports {i_coeffs[7][1]}]  \
  [get_ports {i_coeffs[7][0]}] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_data[0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[0][7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[0][6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[0][5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[0][4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[0][3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[0][2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[0][1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[0][0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[1][7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[1][6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[1][5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[1][4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[1][3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[1][2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[1][1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[1][0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[2][7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[2][6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[2][5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[2][4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[2][3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[2][2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[2][1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[2][0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[3][7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[3][6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[3][5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[3][4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[3][3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[3][2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[3][1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[3][0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[4][7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[4][6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[4][5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[4][4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[4][3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[4][2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[4][1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[4][0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[5][7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[5][6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[5][5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[5][4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[5][3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[5][2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[5][1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[5][0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[6][7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[6][6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[6][5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[6][4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[6][3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[6][2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[6][1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[6][0]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[7][7]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[7][6]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[7][5]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[7][4]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[7][3]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[7][2]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[7][1]}]
set_input_delay -clock [get_clocks clock] -add_delay 0.5 [get_ports {i_coeffs[7][0]}]
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
