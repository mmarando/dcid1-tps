create_clock -name clock -period 0.6 [get_ports i_clock]
set_input_delay   0.5 -clock clock [all_inputs]
set_output_delay  0.5 -clock clock [all_outputs]

# Nucleo paralelo: xs cambia y out_sr captura solo cada 4 ciclos (cnt == 3)
set_multicycle_path 4 -setup -from [get_cells xs_reg*] -to [get_cells out_sr_reg*]
set_multicycle_path 3 -hold  -from [get_cells xs_reg*] -to [get_cells out_sr_reg*]
