module fir_par4_top #(
  NB_IN = 8,
  NB_COEFFS = 8,
  N_COEFFS = 8,
  PARALLELISM = 4,
  NB_OUT = NB_IN + NB_COEFFS + $clog2(N_COEFFS)
)
(
  input signed [NB_IN -1 : 0] i_data [PARALLELISM -1 : 0],
  input signed [NB_COEFFS -1 : 0] i_coeffs [N_COEFFS-1 : 0],
  input i_clock,
  input i_reset,
  output signed [NB_OUT-1 : 0] o_data [PARALLELISM -1 : 0]
);

  reg [1:0] cnt;
  reg clk_div_r;

  always @(posedge i_clock)
  begin
    if (i_reset)
    begin
      cnt <= 0;
      clk_div_r <= 0;
    end
    else
    begin
      cnt <= cnt + 1'b1;
      if (cnt[0])
        clk_div_r <= ~clk_div_r;
    end
  end

  fir_parallel #(
    .NB_IN(NB_IN),
    .NB_COEFFS(NB_COEFFS),
    .N_COEFFS(N_COEFFS),
    .PARALLELISM(PARALLELISM)
  ) u_core (
    .i_data(i_data),
    .i_coeffs(i_coeffs),
    .i_clock(clk_div_r),
    .o_data(o_data)
  );

endmodule
