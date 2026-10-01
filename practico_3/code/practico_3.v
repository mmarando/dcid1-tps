module practico_3 (
    input  wire       i_ck,
    input  wire [1:0] i_sel,
    input  wire       i_data,
    output wire       o_data
);
    wire w_ck_div2;
    wire w_ck_div4;
    wire w_ck_mux;
    reg  r_ff1;
    reg  r_ff2;

    div2 u_div2 (.i_ck(i_ck), .o_ck(w_ck_div2));
    div4 u_div4 (.i_ck(i_ck), .o_ck(w_ck_div4));
    mux3 u_mux (
        .i_a(i_ck),
        .i_b(w_ck_div2),
        .i_c(w_ck_div4),
        .i_sel(i_sel),
        .o_ck(w_ck_mux)
    );

    always @(posedge w_ck_mux) begin
        r_ff1 <= i_data;
        r_ff2 <= r_ff1;
    end

    assign o_data = r_ff2;
endmodule

module div2(input wire i_ck, output wire o_ck);
    reg r_div;
    always @(posedge i_ck)
        r_div <= ~r_div;
    assign o_ck = r_div;
endmodule

module div4(input wire i_ck, output wire o_ck);
    reg [1:0] r_count;
    always @(posedge i_ck)
        r_count <= r_count + 2'b01;
    assign o_ck = r_count[1];
endmodule

module mux3(
    input wire i_a,
    input wire i_b,
    input wire i_c,
    input wire [1:0] i_sel,
    output reg o_ck
);
    always @* begin
        case (i_sel)
            2'b00: o_ck = i_a;
            2'b01: o_ck = i_b;
            2'b10: o_ck = i_c;
            default: o_ck = i_a;
        endcase
    end
endmodule