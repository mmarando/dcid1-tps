module sel_coeffs_sync #(
  parameter NB = 8
)
(
  input  [NB-1 : 0] i_coeffs_a,   // dominio clock_a
  input  [NB-1 : 0] i_coeffs_b,   // dominio clock_a
  input             i_sel,        // dominio clock_a
  input             i_clock_a,
  input             i_clock_b,
  input             i_reset,      // sincrono a clock_a
  output [NB-1 : 0] o_coeffs      // dominio clock_b
);

  // Dominio clock_a: registro de SEL, mux y toggle por cada cambio de seleccion
  reg          sel_reg;
  reg          sel_d;
  reg          sel_tgl;
  reg [NB-1:0] coeffs_mux_reg;

  always @(posedge i_clock_a)
  begin
    if (i_reset)
    begin
      sel_reg        <= 1'b0;
      sel_d          <= 1'b1;   // fuerza una carga inicial del mux al salir de reset
      sel_tgl        <= 1'b0;
      coeffs_mux_reg <= {NB{1'b0}};
    end
    else
    begin
      sel_reg <= i_sel;
      sel_d   <= sel_reg;
      if (sel_reg != sel_d)
      begin
        sel_tgl        <= ~sel_tgl;
        coeffs_mux_reg <= sel_reg ? i_coeffs_b : i_coeffs_a;
      end
    end
  end

  // Cruce de dominio: el toggle se sincroniza con doble flop, el dato se
  // mantiene estable en origen y se muestrea al detectar el cambio en clock_b
  wire sel_tgl_b;

  bit_sync u_sel_sync (
    .i_data (sel_tgl),
    .i_clock(i_clock_b),
    .o_data (sel_tgl_b)
  );

  wire [NB-1 : 0] coeffs_dly;

  random_delay_bits #(
    .NB_IN    (NB),
    .MIN_DELAY(1),
    .MAX_DELAY(8)
  )
  u_data_dly (
    .i_data(coeffs_mux_reg),
    .o_data(coeffs_dly)
  );

  // Dominio clock_b: deteccion de flanco del toggle sincronizado y captura
  reg          sel_tgl_b_d;
  reg [NB-1:0] coeffs_out_reg;

  always @(posedge i_clock_b)
  begin
    sel_tgl_b_d <= sel_tgl_b;
    if (sel_tgl_b != sel_tgl_b_d)
      coeffs_out_reg <= coeffs_dly;
  end

  assign o_coeffs = coeffs_out_reg;

endmodule
