set_clock_latency -min  -rise 0.0266062  [get_clocks {clk_div2}]
set_clock_latency -min  -fall 0.0247186  [get_clocks {clk_div2}]
set_clock_latency -source -early -min -rise  -0.0727062 [get_ports {i_clock}] -clock clock 
set_clock_latency -source -early -min -fall  -0.0736186 [get_ports {i_clock}] -clock clock 
set_clock_latency -source -late -min -rise  -0.0727062 [get_ports {i_clock}] -clock clock 
set_clock_latency -source -late -min -fall  -0.0736186 [get_ports {i_clock}] -clock clock 
