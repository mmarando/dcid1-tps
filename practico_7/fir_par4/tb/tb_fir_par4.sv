`timescale 1ns/1ps

module tb_fir_par4;
  localparam NB_IN = 8, NB_COEFFS = 8, N_COEFFS = 8, PARALLELISM = 4;
  localparam NB_OUT = NB_IN + NB_COEFFS + $clog2(N_COEFFS);
  localparam CLK_PERIOD = 2;
  localparam BLK_CYCLES = 4;
  localparam N_BLOCKS = 128;

  reg  signed [NB_IN-1:0]     i_data   [PARALLELISM-1:0];
  reg  signed [NB_COEFFS-1:0] i_coeffs [N_COEFFS-1:0];
  reg  i_clock;
  reg  i_reset;
  wire signed [NB_OUT-1:0] o_data [PARALLELISM-1:0];

  fir_par4_top #(.NB_IN(NB_IN), .NB_COEFFS(NB_COEFFS), .N_COEFFS(N_COEFFS), .PARALLELISM(PARALLELISM)) dut (
    .i_data(i_data), .i_coeffs(i_coeffs), .i_clock(i_clock), .i_reset(i_reset), .o_data(o_data)
  );

  initial begin
    i_clock = 0;
    forever #(CLK_PERIOD/2) i_clock = ~i_clock;
  end

  initial begin
    i_coeffs[0] = 8'b1111_1001;
    i_coeffs[1] = 8'b1111_0010;
    i_coeffs[2] = 8'b0001_0100;
    i_coeffs[3] = 8'b0011_1000;
    i_coeffs[4] = 8'b0011_1000;
    i_coeffs[5] = 8'b0001_0100;
    i_coeffs[6] = 8'b1111_0010;
    i_coeffs[7] = 8'b1111_1001;
  end

  integer b, c, p;
  initial begin
    i_reset = 1;
    for (p = 0; p < PARALLELISM; p = p + 1) i_data[p] = 0;
    repeat (2) @(negedge i_clock);
    i_reset = 0;
    for (b = 0; b < N_BLOCKS; b = b + 1) begin
      for (p = 0; p < PARALLELISM; p = p + 1) i_data[p] = $random;
      for (c = 0; c < BLK_CYCLES; c = c + 1) @(negedge i_clock);
    end
    #(CLK_PERIOD*4);
    $finish;
  end
endmodule
