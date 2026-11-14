`timescale 1ns/1ps

module tb_fir_serial;
  localparam NB_IN = 8, NB_COEFFS = 8, N_COEFFS = 8;
  localparam NB_OUT = NB_IN + NB_COEFFS + $clog2(N_COEFFS);
  localparam CLK_PERIOD = 2;
  localparam N_SAMPLES = 512;
  localparam N_CYC = N_SAMPLES + 16;
  localparam OFF_MIN = -8, OFF_MAX = 16;

  reg  signed [NB_IN-1:0]  i_data;
  reg  i_clock;
  wire signed [NB_OUT-1:0] o_data;

  fir_serial #(.NB_IN(NB_IN), .NB_COEFFS(NB_COEFFS), .N_COEFFS(N_COEFFS)) dut (
    .i_data(i_data), .i_clock(i_clock), .o_data(o_data)
  );

  reg signed [NB_IN-1:0]     stim [0:N_SAMPLES-1];
  reg signed [NB_COEFFS-1:0] coef [0:N_COEFFS-1];
  reg signed [NB_OUT-1:0]    hist [0:N_CYC-1];
  integer cyc;

  initial begin
    i_clock = 0;
    forever #(CLK_PERIOD/2) i_clock = ~i_clock;
  end

  initial begin
    coef[0] = 8'b1111_1001;
    coef[1] = 8'b1111_0010;
    coef[2] = 8'b0001_0100;
    coef[3] = 8'b0011_1000;
    coef[4] = 8'b0011_1000;
    coef[5] = 8'b0001_0100;
    coef[6] = 8'b1111_0010;
    coef[7] = 8'b1111_1001;
  end

  function integer ref_y(input integer n);
    integer j, cj, sx, acc;
    begin
      acc = 0;
      for (j = 0; j < N_COEFFS; j = j + 1)
        if (n - j >= 0) begin
          cj = coef[j];
          sx = stim[n-j];
          acc = acc + cj*sx;
        end
      ref_y = acc;
    end
  endfunction

  initial cyc = 0;

  always @(negedge i_clock)
    if (cyc < N_CYC) begin
      hist[cyc] = o_data;
      cyc = cyc + 1;
    end

  integer n, c, off, mis, tot, best_mis, best_off, best_tot;
  initial begin : stimulus
    for (n = 0; n < N_SAMPLES; n = n + 1) stim[n] = $random;
    i_data = 0;
    for (n = 0; n < N_SAMPLES; n = n + 1) begin
      @(negedge i_clock);
      i_data = stim[n];
    end
    repeat (16) @(negedge i_clock);
  end

  initial begin : check
    wait (cyc >= N_CYC);
    best_mis = -1;
    for (off = OFF_MIN; off <= OFF_MAX; off = off + 1) begin
      mis = 0;
      tot = 0;
      for (c = 10; c < N_CYC; c = c + 1) begin
        n = c + off;
        if (n >= 12 && n < N_SAMPLES) begin
          tot = tot + 1;
          if (hist[c] !== ref_y(n)) mis = mis + 1;
        end
      end
      if (best_mis < 0 || mis < best_mis) begin
        best_mis = mis;
        best_off = off;
        best_tot = tot;
      end
    end
    if (best_mis == 0)
      $display("PASS tb_fir_serial: %0d samples match reference (lag offset %0d)", best_tot, best_off);
    else
      $display("FAIL tb_fir_serial: %0d of %0d samples mismatch (best lag offset %0d)", best_mis, best_tot, best_off);
    $finish;
  end
endmodule
