# Clock principal
create_clock -name ck -period 1.5 -waveform {0 0.75} [get_ports i_ck]

# Divisores: sobre el pin q del registro
create_generated_clock -name ck_div2 -master_clock ck -divide_by 2 \
    -source [get_ports i_ck] [get_pins u_div2/r_div_reg/q]
create_generated_clock -name ck_div4 -master_clock ck -divide_by 4 \
    -source [get_ports i_ck] [get_pins {u_div4/r_count_reg[1]/q}]

# Salida del mux: un clock por cada entrada, todos con -add
create_generated_clock -name ck_mux_direct -master_clock ck -divide_by 1 -add \
    -source [get_ports i_ck] [get_pins u_mux/o_ck]
create_generated_clock -name ck_mux_div2 -master_clock ck_div2 -divide_by 1 -add \
    -source [get_pins u_mux/i_b] [get_pins u_mux/o_ck]
create_generated_clock -name ck_mux_div4 -master_clock ck_div4 -divide_by 1 -add \
    -source [get_pins u_mux/i_c] [get_pins u_mux/o_ck]

# Los tres clocks del mux son alternativos: nunca están activos a la vez
set_clock_groups -logically_exclusive \
    -group {ck_mux_direct} -group {ck_mux_div2} -group {ck_mux_div4}

set_dont_touch [get_cells u_mux]
