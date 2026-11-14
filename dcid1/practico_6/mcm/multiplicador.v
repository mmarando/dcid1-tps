// Multiplicador complejo MCM: 4 multiplicaciones por constantes (twiddle)

module multiplicador #(
  parameter NB_INPUT    = 9,
  parameter NBF_INPUT   = 7,
  parameter NB_OUTPUT   = 19,
  parameter NBF_OUTPUT  = 14
)
(
  input  signed [NB_INPUT  -1 : 0] i_real,
  input  signed [NB_INPUT  -1 : 0] i_imag,
  output signed [NB_OUTPUT -1 : 0] o_real,
  output signed [NB_OUTPUT -1 : 0] o_imag
);

  localparam signed [8 : 0] twiddle_real = 9'b111010000;
  localparam signed [8 : 0] twiddle_imag = 9'b110001010;

  assign o_real = i_real * twiddle_real - i_imag * twiddle_imag;
  assign o_imag = i_real * twiddle_imag + i_imag * twiddle_real;

endmodule
