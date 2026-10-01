
//input ports
add mapped point i_ck i_ck -type PI PI
add mapped point i_sel[1] i_sel[1] -type PI PI
add mapped point i_sel[0] i_sel[0] -type PI PI
add mapped point i_data i_data -type PI PI

//output ports
add mapped point o_data o_data -type PO PO

//inout ports




//Sequential Pins
add mapped point r_ff2/q r_ff2_reg/Q -type DFF DFF
add mapped point r_ff1/q r_ff1_reg/Q -type DFF DFF
add mapped point u_div4/r_count[1]/q u_div4_r_count_reg[1]/Q -type DFF DFF
add mapped point u_div2/r_div/q u_div2_r_div_reg/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
