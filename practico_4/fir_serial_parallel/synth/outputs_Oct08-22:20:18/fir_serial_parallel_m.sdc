# ####################################################################

#  Created by Genus(TM) Synthesis Solution 23.10-p004_1 on Thu Oct 08 22:22:01 -03 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design fir_serial_parallel

create_clock -name "clock" -period 0.6 -waveform {0.0 0.3} [get_ports i_clock]
group_path -name cg_enable_group_clock -through [list \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST4/enable]  \
  [get_pins RC_CG_HIER_INST4/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST4/enable]  \
  [get_pins RC_CG_HIER_INST4/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST4/enable]  \
  [get_pins RC_CG_HIER_INST4/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST0/enable]  \
  [get_pins RC_CG_HIER_INST0/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST1/enable]  \
  [get_pins RC_CG_HIER_INST1/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST2/enable]  \
  [get_pins RC_CG_HIER_INST2/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST3/enable]  \
  [get_pins RC_CG_HIER_INST3/RC_CGIC_INST/E]  \
  [get_pins RC_CG_HIER_INST4/enable]  \
  [get_pins RC_CG_HIER_INST4/RC_CGIC_INST/E] ]
set_multicycle_path -from [list \
  [get_cells {xs_reg[0][0]}]  \
  [get_cells {xs_reg[0][1]}]  \
  [get_cells {xs_reg[0][2]}]  \
  [get_cells {xs_reg[0][3]}]  \
  [get_cells {xs_reg[0][4]}]  \
  [get_cells {xs_reg[0][5]}]  \
  [get_cells {xs_reg[0][6]}]  \
  [get_cells {xs_reg[0][7]}]  \
  [get_cells {xs_reg[1][0]}]  \
  [get_cells {xs_reg[1][1]}]  \
  [get_cells {xs_reg[1][2]}]  \
  [get_cells {xs_reg[1][3]}]  \
  [get_cells {xs_reg[1][4]}]  \
  [get_cells {xs_reg[1][5]}]  \
  [get_cells {xs_reg[1][6]}]  \
  [get_cells {xs_reg[1][7]}]  \
  [get_cells {xs_reg[2][0]}]  \
  [get_cells {xs_reg[2][1]}]  \
  [get_cells {xs_reg[2][2]}]  \
  [get_cells {xs_reg[2][3]}]  \
  [get_cells {xs_reg[2][4]}]  \
  [get_cells {xs_reg[2][5]}]  \
  [get_cells {xs_reg[2][6]}]  \
  [get_cells {xs_reg[3][0]}]  \
  [get_cells {xs_reg[3][1]}]  \
  [get_cells {xs_reg[3][2]}]  \
  [get_cells {xs_reg[3][3]}]  \
  [get_cells {xs_reg[3][4]}]  \
  [get_cells {xs_reg[3][5]}]  \
  [get_cells {xs_reg[3][6]}]  \
  [get_cells {xs_reg[3][7]}]  \
  [get_cells {xs_reg[4][0]}]  \
  [get_cells {xs_reg[4][1]}]  \
  [get_cells {xs_reg[4][2]}]  \
  [get_cells {xs_reg[4][3]}]  \
  [get_cells {xs_reg[4][4]}]  \
  [get_cells {xs_reg[4][5]}]  \
  [get_cells {xs_reg[4][6]}]  \
  [get_cells {xs_reg[4][7]}]  \
  [get_cells {xs_reg[5][0]}]  \
  [get_cells {xs_reg[5][1]}]  \
  [get_cells {xs_reg[5][2]}]  \
  [get_cells {xs_reg[5][3]}]  \
  [get_cells {xs_reg[5][4]}]  \
  [get_cells {xs_reg[5][5]}]  \
  [get_cells {xs_reg[5][6]}]  \
  [get_cells {xs_reg[5][7]}]  \
  [get_cells {xs_reg[6][0]}]  \
  [get_cells {xs_reg[6][1]}]  \
  [get_cells {xs_reg[6][2]}]  \
  [get_cells {xs_reg[6][3]}]  \
  [get_cells {xs_reg[6][4]}]  \
  [get_cells {xs_reg[6][5]}]  \
  [get_cells {xs_reg[6][6]}]  \
  [get_cells {xs_reg[6][7]}]  \
  [get_cells {xs_reg[7][0]}]  \
  [get_cells {xs_reg[7][1]}]  \
  [get_cells {xs_reg[7][2]}]  \
  [get_cells {xs_reg[7][3]}]  \
  [get_cells {xs_reg[7][4]}]  \
  [get_cells {xs_reg[7][5]}]  \
  [get_cells {xs_reg[7][6]}]  \
  [get_cells {xs_reg[7][7]}]  \
  [get_cells {xs_reg[8][0]}]  \
  [get_cells {xs_reg[8][1]}]  \
  [get_cells {xs_reg[8][2]}]  \
  [get_cells {xs_reg[8][3]}]  \
  [get_cells {xs_reg[8][4]}]  \
  [get_cells {xs_reg[8][5]}]  \
  [get_cells {xs_reg[8][6]}]  \
  [get_cells {xs_reg[8][7]}]  \
  [get_cells {xs_reg[9][0]}]  \
  [get_cells {xs_reg[9][1]}]  \
  [get_cells {xs_reg[9][2]}]  \
  [get_cells {xs_reg[9][4]}]  \
  [get_cells {xs_reg[9][5]}]  \
  [get_cells {xs_reg[9][7]}]  \
  [get_cells {xs_reg[10][0]}]  \
  [get_cells {xs_reg[10][1]}]  \
  [get_cells {xs_reg[10][2]}]  \
  [get_cells {xs_reg[10][3]}]  \
  [get_cells {xs_reg[10][4]}]  \
  [get_cells {xs_reg[10][5]}]  \
  [get_cells {xs_reg[10][6]}]  \
  [get_cells {xs_reg[10][7]}]  \
  [get_cells {xs_reg[2][7]}]  \
  [get_cells {xs_reg[9][6]}]  \
  [get_cells {xs_reg[9][3]}] ] -to [list \
  [get_cells RC_CG_HIER_INST3/RC_CGIC_INST]  \
  [get_cells {out_sr_reg[0][0]}]  \
  [get_cells {out_sr_reg[0][1]}]  \
  [get_cells {out_sr_reg[0][2]}]  \
  [get_cells {out_sr_reg[0][3]}]  \
  [get_cells {out_sr_reg[0][4]}]  \
  [get_cells {out_sr_reg[0][5]}]  \
  [get_cells {out_sr_reg[0][6]}]  \
  [get_cells {out_sr_reg[0][7]}]  \
  [get_cells {out_sr_reg[0][8]}]  \
  [get_cells {out_sr_reg[0][9]}]  \
  [get_cells {out_sr_reg[0][10]}]  \
  [get_cells {out_sr_reg[0][11]}]  \
  [get_cells {out_sr_reg[0][12]}]  \
  [get_cells {out_sr_reg[0][13]}]  \
  [get_cells {out_sr_reg[0][14]}]  \
  [get_cells {out_sr_reg[0][15]}]  \
  [get_cells {out_sr_reg[1][0]}]  \
  [get_cells {out_sr_reg[1][1]}]  \
  [get_cells {out_sr_reg[1][2]}]  \
  [get_cells {out_sr_reg[1][3]}]  \
  [get_cells {out_sr_reg[1][4]}]  \
  [get_cells {out_sr_reg[1][5]}]  \
  [get_cells {out_sr_reg[1][6]}]  \
  [get_cells {out_sr_reg[1][7]}]  \
  [get_cells {out_sr_reg[1][8]}]  \
  [get_cells {out_sr_reg[1][9]}]  \
  [get_cells {out_sr_reg[1][10]}]  \
  [get_cells {out_sr_reg[1][11]}]  \
  [get_cells {out_sr_reg[1][12]}]  \
  [get_cells {out_sr_reg[1][13]}]  \
  [get_cells {out_sr_reg[1][14]}]  \
  [get_cells {out_sr_reg[1][15]}]  \
  [get_cells {out_sr_reg[2][0]}]  \
  [get_cells {out_sr_reg[2][1]}]  \
  [get_cells {out_sr_reg[2][2]}]  \
  [get_cells {out_sr_reg[2][3]}]  \
  [get_cells {out_sr_reg[2][4]}]  \
  [get_cells {out_sr_reg[2][5]}]  \
  [get_cells {out_sr_reg[2][6]}]  \
  [get_cells {out_sr_reg[2][7]}]  \
  [get_cells {out_sr_reg[2][8]}]  \
  [get_cells {out_sr_reg[2][9]}]  \
  [get_cells {out_sr_reg[2][10]}]  \
  [get_cells {out_sr_reg[2][11]}]  \
  [get_cells {out_sr_reg[2][12]}]  \
  [get_cells {out_sr_reg[2][13]}]  \
  [get_cells {out_sr_reg[2][14]}]  \
  [get_cells {out_sr_reg[2][15]}]  \
  [get_cells {out_sr_reg[3][0]}]  \
  [get_cells {out_sr_reg[3][1]}]  \
  [get_cells {out_sr_reg[3][2]}]  \
  [get_cells {out_sr_reg[3][3]}]  \
  [get_cells {out_sr_reg[3][4]}]  \
  [get_cells {out_sr_reg[3][5]}]  \
  [get_cells {out_sr_reg[3][6]}]  \
  [get_cells {out_sr_reg[3][7]}]  \
  [get_cells {out_sr_reg[3][8]}]  \
  [get_cells {out_sr_reg[3][9]}]  \
  [get_cells {out_sr_reg[3][10]}]  \
  [get_cells {out_sr_reg[3][11]}]  \
  [get_cells {out_sr_reg[3][12]}]  \
  [get_cells {out_sr_reg[3][13]}]  \
  [get_cells {out_sr_reg[3][14]}]  \
  [get_cells {out_sr_reg[3][15]}] ] -setup -end 4
set_multicycle_path -from [list \
  [get_cells {xs_reg[0][0]}]  \
  [get_cells {xs_reg[0][1]}]  \
  [get_cells {xs_reg[0][2]}]  \
  [get_cells {xs_reg[0][3]}]  \
  [get_cells {xs_reg[0][4]}]  \
  [get_cells {xs_reg[0][5]}]  \
  [get_cells {xs_reg[0][6]}]  \
  [get_cells {xs_reg[0][7]}]  \
  [get_cells {xs_reg[1][0]}]  \
  [get_cells {xs_reg[1][1]}]  \
  [get_cells {xs_reg[1][2]}]  \
  [get_cells {xs_reg[1][3]}]  \
  [get_cells {xs_reg[1][4]}]  \
  [get_cells {xs_reg[1][5]}]  \
  [get_cells {xs_reg[1][6]}]  \
  [get_cells {xs_reg[1][7]}]  \
  [get_cells {xs_reg[2][0]}]  \
  [get_cells {xs_reg[2][1]}]  \
  [get_cells {xs_reg[2][2]}]  \
  [get_cells {xs_reg[2][3]}]  \
  [get_cells {xs_reg[2][4]}]  \
  [get_cells {xs_reg[2][5]}]  \
  [get_cells {xs_reg[2][6]}]  \
  [get_cells {xs_reg[3][0]}]  \
  [get_cells {xs_reg[3][1]}]  \
  [get_cells {xs_reg[3][2]}]  \
  [get_cells {xs_reg[3][3]}]  \
  [get_cells {xs_reg[3][4]}]  \
  [get_cells {xs_reg[3][5]}]  \
  [get_cells {xs_reg[3][6]}]  \
  [get_cells {xs_reg[3][7]}]  \
  [get_cells {xs_reg[4][0]}]  \
  [get_cells {xs_reg[4][1]}]  \
  [get_cells {xs_reg[4][2]}]  \
  [get_cells {xs_reg[4][3]}]  \
  [get_cells {xs_reg[4][4]}]  \
  [get_cells {xs_reg[4][5]}]  \
  [get_cells {xs_reg[4][6]}]  \
  [get_cells {xs_reg[4][7]}]  \
  [get_cells {xs_reg[5][0]}]  \
  [get_cells {xs_reg[5][1]}]  \
  [get_cells {xs_reg[5][2]}]  \
  [get_cells {xs_reg[5][3]}]  \
  [get_cells {xs_reg[5][4]}]  \
  [get_cells {xs_reg[5][5]}]  \
  [get_cells {xs_reg[5][6]}]  \
  [get_cells {xs_reg[5][7]}]  \
  [get_cells {xs_reg[6][0]}]  \
  [get_cells {xs_reg[6][1]}]  \
  [get_cells {xs_reg[6][2]}]  \
  [get_cells {xs_reg[6][3]}]  \
  [get_cells {xs_reg[6][4]}]  \
  [get_cells {xs_reg[6][5]}]  \
  [get_cells {xs_reg[6][6]}]  \
  [get_cells {xs_reg[6][7]}]  \
  [get_cells {xs_reg[7][0]}]  \
  [get_cells {xs_reg[7][1]}]  \
  [get_cells {xs_reg[7][2]}]  \
  [get_cells {xs_reg[7][3]}]  \
  [get_cells {xs_reg[7][4]}]  \
  [get_cells {xs_reg[7][5]}]  \
  [get_cells {xs_reg[7][6]}]  \
  [get_cells {xs_reg[7][7]}]  \
  [get_cells {xs_reg[8][0]}]  \
  [get_cells {xs_reg[8][1]}]  \
  [get_cells {xs_reg[8][2]}]  \
  [get_cells {xs_reg[8][3]}]  \
  [get_cells {xs_reg[8][4]}]  \
  [get_cells {xs_reg[8][5]}]  \
  [get_cells {xs_reg[8][6]}]  \
  [get_cells {xs_reg[8][7]}]  \
  [get_cells {xs_reg[9][0]}]  \
  [get_cells {xs_reg[9][1]}]  \
  [get_cells {xs_reg[9][2]}]  \
  [get_cells {xs_reg[9][4]}]  \
  [get_cells {xs_reg[9][5]}]  \
  [get_cells {xs_reg[9][7]}]  \
  [get_cells {xs_reg[10][0]}]  \
  [get_cells {xs_reg[10][1]}]  \
  [get_cells {xs_reg[10][2]}]  \
  [get_cells {xs_reg[10][3]}]  \
  [get_cells {xs_reg[10][4]}]  \
  [get_cells {xs_reg[10][5]}]  \
  [get_cells {xs_reg[10][6]}]  \
  [get_cells {xs_reg[10][7]}]  \
  [get_cells {xs_reg[2][7]}]  \
  [get_cells {xs_reg[9][6]}]  \
  [get_cells {xs_reg[9][3]}] ] -to [list \
  [get_cells RC_CG_HIER_INST3/RC_CGIC_INST]  \
  [get_cells {out_sr_reg[0][0]}]  \
  [get_cells {out_sr_reg[0][1]}]  \
  [get_cells {out_sr_reg[0][2]}]  \
  [get_cells {out_sr_reg[0][3]}]  \
  [get_cells {out_sr_reg[0][4]}]  \
  [get_cells {out_sr_reg[0][5]}]  \
  [get_cells {out_sr_reg[0][6]}]  \
  [get_cells {out_sr_reg[0][7]}]  \
  [get_cells {out_sr_reg[0][8]}]  \
  [get_cells {out_sr_reg[0][9]}]  \
  [get_cells {out_sr_reg[0][10]}]  \
  [get_cells {out_sr_reg[0][11]}]  \
  [get_cells {out_sr_reg[0][12]}]  \
  [get_cells {out_sr_reg[0][13]}]  \
  [get_cells {out_sr_reg[0][14]}]  \
  [get_cells {out_sr_reg[0][15]}]  \
  [get_cells {out_sr_reg[1][0]}]  \
  [get_cells {out_sr_reg[1][1]}]  \
  [get_cells {out_sr_reg[1][2]}]  \
  [get_cells {out_sr_reg[1][3]}]  \
  [get_cells {out_sr_reg[1][4]}]  \
  [get_cells {out_sr_reg[1][5]}]  \
  [get_cells {out_sr_reg[1][6]}]  \
  [get_cells {out_sr_reg[1][7]}]  \
  [get_cells {out_sr_reg[1][8]}]  \
  [get_cells {out_sr_reg[1][9]}]  \
  [get_cells {out_sr_reg[1][10]}]  \
  [get_cells {out_sr_reg[1][11]}]  \
  [get_cells {out_sr_reg[1][12]}]  \
  [get_cells {out_sr_reg[1][13]}]  \
  [get_cells {out_sr_reg[1][14]}]  \
  [get_cells {out_sr_reg[1][15]}]  \
  [get_cells {out_sr_reg[2][0]}]  \
  [get_cells {out_sr_reg[2][1]}]  \
  [get_cells {out_sr_reg[2][2]}]  \
  [get_cells {out_sr_reg[2][3]}]  \
  [get_cells {out_sr_reg[2][4]}]  \
  [get_cells {out_sr_reg[2][5]}]  \
  [get_cells {out_sr_reg[2][6]}]  \
  [get_cells {out_sr_reg[2][7]}]  \
  [get_cells {out_sr_reg[2][8]}]  \
  [get_cells {out_sr_reg[2][9]}]  \
  [get_cells {out_sr_reg[2][10]}]  \
  [get_cells {out_sr_reg[2][11]}]  \
  [get_cells {out_sr_reg[2][12]}]  \
  [get_cells {out_sr_reg[2][13]}]  \
  [get_cells {out_sr_reg[2][14]}]  \
  [get_cells {out_sr_reg[2][15]}]  \
  [get_cells {out_sr_reg[3][0]}]  \
  [get_cells {out_sr_reg[3][1]}]  \
  [get_cells {out_sr_reg[3][2]}]  \
  [get_cells {out_sr_reg[3][3]}]  \
  [get_cells {out_sr_reg[3][4]}]  \
  [get_cells {out_sr_reg[3][5]}]  \
  [get_cells {out_sr_reg[3][6]}]  \
  [get_cells {out_sr_reg[3][7]}]  \
  [get_cells {out_sr_reg[3][8]}]  \
  [get_cells {out_sr_reg[3][9]}]  \
  [get_cells {out_sr_reg[3][10]}]  \
  [get_cells {out_sr_reg[3][11]}]  \
  [get_cells {out_sr_reg[3][12]}]  \
  [get_cells {out_sr_reg[3][13]}]  \
  [get_cells {out_sr_reg[3][14]}]  \
  [get_cells {out_sr_reg[3][15]}] ] -hold -start 3
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
