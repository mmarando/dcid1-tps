set_clock_latency -min  -rise 0.0376837  [get_clocks {clk_div2}]
set_clock_latency -min  -fall 0.0348434  [get_clocks {clk_div2}]
set_clock_latency -source -early -min -rise  -0.0774837 [get_ports {i_clock}] -clock clock 
set_clock_latency -source -early -min -fall  -0.0782434 [get_ports {i_clock}] -clock clock 
set_clock_latency -source -late -min -rise  -0.0774837 [get_ports {i_clock}] -clock clock 
set_clock_latency -source -late -min -fall  -0.0782434 [get_ports {i_clock}] -clock clock 
