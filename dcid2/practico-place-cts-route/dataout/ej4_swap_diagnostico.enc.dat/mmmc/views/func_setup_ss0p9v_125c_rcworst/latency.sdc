set_clock_latency -max  -rise 0.116658  [get_clocks {clk_div2}]
set_clock_latency -max  -fall 0.110061  [get_clocks {clk_div2}]
set_clock_latency -source -early -max -rise  -0.243558 [get_ports {i_clock}] -clock clock 
set_clock_latency -source -early -max -fall  -0.252461 [get_ports {i_clock}] -clock clock 
set_clock_latency -source -late -max -rise  -0.243558 [get_ports {i_clock}] -clock clock 
set_clock_latency -source -late -max -fall  -0.252461 [get_ports {i_clock}] -clock clock 
