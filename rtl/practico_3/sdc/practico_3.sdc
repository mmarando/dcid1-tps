# main clock definition
create_clock -name CK  \
             -period 2  \
             -waveform {0 1}   \
              [get_port i_ck]


# generated clock definition
create_generated_clock  -name gen_CK_div2  \
                        -divide_by 2      \
			-add               \
                        -master_clock CK    \
                        -source [get_pin u_FFDIV2/CK]  \
                                [get_pin u_FFDIV2/Q]

create_generated_clock  -name gen_CK_MUX_div2     \
                        -divide_by 1             \
                        -master_clock  gen_CK_div2   \
			-add                         \
                        -source [get_pin u_mod1_inst/u_mod2_inst/u_mux/A]  \
                                [get_pin u_mod1_inst/u_mod2_inst/u_mux/Y]

create_generated_clock  -name gen_CK_MUX  \
                        -divide_by 1       \
                         -add               \
                         -master_clock CK   \
                         -source [get_pin u_mod1_inst/u_mod2_inst/u_mux/B]   \
                                 [get_pin u_mod1_inst/u_mod2_inst/u_mux/Y]

# virtual clock defintion
create_clock -name vir_CK -period 2


#clock uncertainty definition
set_clock_uncertainty 0.3 [get_clock gen_CK_MUX]

# clock group definitions
set_clock_group  -name umux  \
		 -physically_exclusive  \
		 -group {gen_CK_MUX}       \
		 -group {gen_CK_MUX_div2}



set_clock_group  -name umux_async \
                 -asynchronous    \
                 -group {CK gen_CK_MUX vir_CK} \
                 -group {gen_CK_MUX_div2}

# to prevent synthesis tool to replace mux by other comb logic
set_dont_touch u_mod1_inst/u_mod2_inst/u_mux



