create_clock -name clock -period 2 [get_ports i_clock]
create_generated_clock -name div_clock -source [get_ports i_clock] -divide_by 4 [get_pins -hier clk_div_r_reg/Q]

set_input_delay   0.5 -clock div_clock [get_ports i_data*]
set_input_delay   0.5 -clock clock     [get_ports i_reset]
set_output_delay  0.5 -clock div_clock [all_outputs]

set_false_path -from [get_ports i_coeffs*]
