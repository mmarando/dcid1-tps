`timescale 1ns/1ps

module tb_fir_par4;
  localparam NB_IN = 8, NB_COEFFS = 8, N_COEFFS = 8, PARALLELISM = 4;
  localparam NB_OUT = NB_IN + NB_COEFFS + $clog2(N_COEFFS);
  localparam CLK_PERIOD = 2;
  localparam BLK_CYCLES = 4;
  localparam N_BLOCKS = 128;
  localparam N_SAMPLES = N_BLOCKS*PARALLELISM;
  localparam N_CYC = N_BLOCKS*BLK_CYCLES + 16;
  localparam OFF_MIN = -32, OFF_MAX = 8;

  reg  signed [NB_IN-1:0]     i_data   [PARALLELISM-1:0];
  reg  signed [NB_COEFFS-1:0] i_coeffs [N_COEFFS-1:0];
  reg  i_clock;
  reg  i_reset;
  wire signed [NB_OUT-1:0] o_data [PARALLELISM-1:0];

  fir_par4_top #(.NB_IN(NB_IN), .NB_COEFFS(NB_COEFFS), .N_COEFFS(N_COEFFS), .PARALLELISM(PARALLELISM)) dut (
    .i_data(i_data), .i_coeffs(i_coeffs), .i_clock(i_clock), .i_reset(i_reset), .o_data(o_data)
  );

  reg signed [NB_IN-1:0]  stim [0:N_SAMPLES-1];
  reg signed [NB_OUT-1:0] hist [0:PARALLELISM-1][0:N_CYC-1];
  integer cyc;

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

  function integer ref_y(input integer n);
    integer j, cj, sx, acc;
    begin
      acc = 0;
      for (j = 0; j < N_COEFFS; j = j + 1)
        if (n - j >= 0) begin
          cj = i_coeffs[j];
          sx = stim[n-j];
          acc = acc + cj*sx;
        end
      ref_y = acc;
    end
  endfunction

  initial cyc = 0;

  integer l;
  always @(negedge i_clock)
    if (cyc < N_CYC) begin
      for (l = 0; l < PARALLELISM; l = l + 1) hist[l][cyc] = o_data[l];
      cyc = cyc + 1;
    end

  integer n, b, c, p, t, ph, off, tot, mis_total, best_mis, best_off, best_ph, best_tot;
  integer lane_mis [0:PARALLELISM-1];
  integer best_lane [0:PARALLELISM-1];
  initial begin : stimulus
    for (n = 0; n < N_SAMPLES; n = n + 1) stim[n] = $random;
    i_reset = 1;
    for (p = 0; p < PARALLELISM; p = p + 1) i_data[p] = 0;
    repeat (2) @(negedge i_clock);
    i_reset = 0;
    for (b = 0; b < N_BLOCKS; b = b + 1) begin
      for (p = 0; p < PARALLELISM; p = p + 1) i_data[p] = stim[PARALLELISM*b + p];
      for (c = 0; c < BLK_CYCLES; c = c + 1) @(negedge i_clock);
    end
    repeat (16) @(negedge i_clock);
  end

  initial begin : check
    wait (cyc >= N_CYC);
    best_mis = -1;
    for (off = OFF_MIN; off <= OFF_MAX; off = off + 1)
      for (ph = 0; ph < BLK_CYCLES; ph = ph + 1) begin
        for (l = 0; l < PARALLELISM; l = l + 1) lane_mis[l] = 0;
        tot = 0;
        for (t = 16; t < N_BLOCKS - 4; t = t + 1)
          for (l = 0; l < PARALLELISM; l = l + 1) begin
            n = PARALLELISM*t + l + off;
            tot = tot + 1;
            if (hist[l][BLK_CYCLES*t + ph] !== ref_y(n)) lane_mis[l] = lane_mis[l] + 1;
          end
        mis_total = 0;
        for (l = 0; l < PARALLELISM; l = l + 1) mis_total = mis_total + lane_mis[l];
        if (best_mis < 0 || mis_total < best_mis) begin
          best_mis = mis_total;
          best_off = off;
          best_ph = ph;
          best_tot = tot;
          for (l = 0; l < PARALLELISM; l = l + 1) best_lane[l] = lane_mis[l];
        end
      end
    if (best_mis == 0)
      $display("PASS tb_fir_par4: all %0d lane samples match reference (lag offset %0d, phase %0d)", best_tot, best_off, best_ph);
    else
      $display("FAIL tb_fir_par4: %0d of %0d lane samples mismatch (best lag offset %0d, phase %0d). Per lane: %0d %0d %0d %0d",
               best_mis, best_tot, best_off, best_ph, best_lane[0], best_lane[1], best_lane[2], best_lane[3]);
    $finish;
  end
endmodule
