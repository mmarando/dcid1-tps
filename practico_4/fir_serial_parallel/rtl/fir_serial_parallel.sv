module fir_serial_parallel #(
  NB_IN = 8,
  NB_COEFFS = 8,
  N_COEFFS = 8,
  PARALLELISM = 4,
  NB_OUT = NB_IN + NB_COEFFS + $clog2(N_COEFFS)
)
(
  input signed [NB_IN -1 : 0] i_data,
  input i_reset,
  input i_clock,
  output signed [NB_OUT-1 : 0] o_data
);

  localparam W     = N_COEFFS - 1 + PARALLELISM;
  localparam CNT_W = $clog2(PARALLELISM);

  wire signed [NB_COEFFS -1 : 0] coeffs [N_COEFFS -1 : 0];

  // Coeficientes fijos
  assign coeffs[0] = 8'b1111_1001;
  assign coeffs[1] = 8'b1111_0010;
  assign coeffs[2] = 8'b0001_0100;
  assign coeffs[3] = 8'b0011_1000;
  assign coeffs[4] = 8'b0011_1000;
  assign coeffs[5] = 8'b0001_0100;
  assign coeffs[6] = 8'b1111_0010;
  assign coeffs[7] = 8'b1111_1001;

  // Clock divider: gen_clock = i_clock / PARALLELISM
  reg [CNT_W-1 : 0] cnt;
  reg [CNT_W-1 : 0] cnt_d;
  reg gen_clock;

  always @(posedge i_clock)
  begin
    if (i_reset)
    begin
      cnt       <= 0;
      cnt_d     <= 0;
      gen_clock <= 1'b0;
    end
    else
    begin
      cnt   <= cnt + 1'b1;
      cnt_d <= cnt;
      if (cnt[0])
        gen_clock <= ~gen_clock;  // invierte cada PARALLELISM/2 ciclos
    end
  end

  // Entrada serial -> bloque de PARALLELISM muestras (clock rapido)
  reg signed [NB_IN -1 : 0] in_blk [PARALLELISM-1 : 0];

  always @(posedge i_clock)
    in_blk[cnt] <= i_data;

  // Nucleo paralelo (clock lento gen_clock)
  reg signed [NB_IN -1 : 0] xs [W-1 : 0];
  reg signed [NB_OUT-1 : 0] out_blk [PARALLELISM-1 : 0];
  reg signed [NB_OUT-1 : 0] y [PARALLELISM-1 : 0];

  integer p, k, q;

  always @(*)
  begin
    for(p = 0; p < PARALLELISM; p = p+1)
    begin
      y[p] = 0;
      for(k = 0; k < N_COEFFS; k = k+1)
        y[p] = y[p] + xs[N_COEFFS-1+p-k]*coeffs[k];
    end
  end

  always @(posedge gen_clock)
  begin
    for(q = 0; q < W-PARALLELISM; q = q+1)
      xs[q] <= xs[q+PARALLELISM];
    for(q = 0; q < PARALLELISM; q = q+1)
      xs[W-PARALLELISM+q] <= in_blk[q];

    for(q = 0; q < PARALLELISM; q = q+1)
      out_blk[q] <= y[q];
  end

  // Paralelo -> serial (clock rapido)
  assign o_data = out_blk[cnt_d];

endmodule
