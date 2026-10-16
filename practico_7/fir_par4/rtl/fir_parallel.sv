module fir_parallel #(
  NB_IN = 8,
  NB_COEFFS = 8,
  N_COEFFS = 8,
  PARALLELISM = 2,
  NB_OUT = NB_IN + NB_COEFFS + $clog2(N_COEFFS)
)
(
  input signed [NB_IN -1 : 0] i_data [PARALLELISM -1 : 0],
  input signed [NB_COEFFS -1 : 0] i_coeffs [N_COEFFS-1 : 0],
  input i_clock,
  output signed [NB_OUT-1 : 0] o_data [PARALLELISM -1 : 0]
);

  localparam NBUF = N_COEFFS-1+PARALLELISM;

  reg signed [NB_IN -1 : 0] sample_buf [NBUF-1 : 0];

  wire signed [NB_OUT-1 : 0] data_out [PARALLELISM -1 : 0];
  reg signed [NB_OUT-1 : 0] data_out_reg [PARALLELISM -1 : 0];

  integer i, k;

  always @(posedge i_clock)
  begin
    for(i = 0; i < NBUF-PARALLELISM; i = i+1)
    begin
      sample_buf[i] <= sample_buf[i+PARALLELISM];
    end

    for(k = 0; k < PARALLELISM; k = k+1)
    begin
      sample_buf[NBUF-PARALLELISM+k] <= i_data[k];
    end

    data_out_reg <= data_out;
  end

  genvar l,s;

  generate
    wire [NB_IN*N_COEFFS -1 : 0] fir_input[PARALLELISM -1 : 0];
    for(l = 0; l < PARALLELISM; l = l+1)
    begin
      for(s = 0; s < N_COEFFS; s = s+1)
      begin
        assign fir_input[l][(s+1)*NB_IN -1 -: NB_IN] = sample_buf[N_COEFFS-1+l-s];
      end
      fir_instance u_fir(
        .i_data(fir_input[l]),
        .i_coeffs(i_coeffs),
        .o_data(data_out[l])
      );

      assign o_data[l] = data_out_reg[l];
    end
  endgenerate

endmodule
