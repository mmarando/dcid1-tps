`timescale 1ns/1ps

module tb_fir_serial;
  localparam NB_IN = 8, NB_COEFFS = 8, N_COEFFS = 8;
  localparam NB_OUT = NB_IN + NB_COEFFS + $clog2(N_COEFFS);
  localparam CLK_PERIOD = 2;
  localparam N_SAMPLES = 512;

  reg  signed [NB_IN-1:0]  i_data;
  reg  i_clock;
  wire signed [NB_OUT-1:0] o_data;

  fir_serial #(.NB_IN(NB_IN), .NB_COEFFS(NB_COEFFS), .N_COEFFS(N_COEFFS)) dut (
    .i_data(i_data), .i_clock(i_clock), .o_data(o_data)
  );

  initial begin
    i_clock = 0;
    forever #(CLK_PERIOD/2) i_clock = ~i_clock;
  end

  integer n;
  initial begin
    i_data = 0;
    @(negedge i_clock);
    for (n = 0; n < N_SAMPLES; n = n + 1) begin
      i_data = $random;
      @(negedge i_clock);
    end
    #(CLK_PERIOD*4);
    $finish;
  end
endmodule
