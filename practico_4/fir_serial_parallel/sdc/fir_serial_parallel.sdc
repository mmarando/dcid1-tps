create_clock -name clock -period 1.0 [get_ports i_clock]
set_input_delay   0.5 -clock clock [all_inputs]
set_output_delay  0.5 -clock clock [all_outputs]

# Clock dividido por PARALLELISM (4) generado por gen_clock_reg
create_generated_clock \
    -name clk_div4 \
    -source [get_ports i_clock] \
    -divide_by 4 \
    [get_pins pin:fir_serial_parallel/gen_clock_reg/Q]
