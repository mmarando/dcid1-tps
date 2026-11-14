`timescale 1ns/1ps

module practico_3_tb;
    reg i_ck;
    reg [1:0] i_sel;
    reg i_data;
    wire o_data;
    integer k;
    reg expected_div2;
    reg expected_div4;

    practico_3 dut (
        .i_ck(i_ck),
        .i_sel(i_sel),
        .i_data(i_data),
        .o_data(o_data)
    );

    initial begin
        i_ck = 1'b0;
        forever #5 i_ck = ~i_ck;
    end

    initial begin
        i_sel = 2'b00;
        i_data = 1'b0;
        #1;
        dut.u_div2.r_div = 1'b0;
        dut.u_div4.r_count = 2'b00;

        for (k = 0; k < 8; k = k + 1) begin
            @(posedge i_ck);
            #1;

            expected_div2 = (k % 2) == 0;
            case (k % 4)
                0: expected_div4 = 1'b0;
                1: expected_div4 = 1'b1;
                2: expected_div4 = 1'b1;
                default: expected_div4 = 1'b0;
            endcase

            if (dut.w_ck_div2 !== expected_div2)
                $fatal(1, "divide-by-2 mismatch at edge %0d", k);
            if (dut.w_ck_div4 !== expected_div4)
                $fatal(1, "divide-by-4 mismatch at edge %0d", k);

            i_sel = 2'b00;
            #0.1;
            if (dut.w_ck_mux !== i_ck)
                $fatal(1, "selector 00 did not select i_ck at edge %0d", k);

            i_sel = 2'b01;
            #0.1;
            if (dut.w_ck_mux !== dut.w_ck_div2)
                $fatal(1, "selector 01 did not select divide-by-2 at edge %0d", k);

            i_sel = 2'b10;
            #0.1;
            if (dut.w_ck_mux !== dut.w_ck_div4)
                $fatal(1, "selector 10 did not select divide-by-4 at edge %0d", k);

            i_sel = 2'b11;
            #0.1;
            if (dut.w_ck_mux !== i_ck)
                $fatal(1, "selector 11 did not fall back to i_ck at edge %0d", k);
        end

        $display("PASS: divider and mux checks");
        $finish;
    end
endmodule
