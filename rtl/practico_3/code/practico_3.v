// ============================================================
// Estructura RTL (placeholders de celdas) según el diagrama
// Top: u_top
// Puertos: i_data1, i_data2, i_ck, i_sel, o_data1, o_data2
// MUX de clock: selecciona entre ck_div2 y ck_buf
// ============================================================

module practico_3 (
    input  wire i_data1,
    input  wire i_data2,
    input  wire i_ck,
    input  wire i_sel,     // select del clock mux
    output wire o_data1,
    output wire o_data2
);
    // -------------------------
    // Clocks
    // -------------------------
    wire ck_div2;   // salida del divisor (ck1)
    wire ck_buf;    // salida del buffer   (ck2)

    // Divisor por 2 con FF + inversor (u_FFDIV2)
    wire q_div2, q_div2_b;
    // TODO: reemplazar CELL_DFF_FE por tu celda real
    DFFHQX2 u_FFDIV2 ( .Q(q_div2), .D(q_div2_b), .CK(i_ck) );
    // TODO: reemplazar CELL_INV por tu celda real
    CLKINVX4    u_inv1   ( .Y(q_div2_b), .A(q_div2) );
    assign ck_div2 = q_div2;

    // Buffer de clock (u_buff2)
    // TODO: reemplazar CELL_BUF por tu celda real
    CLKBUFX4 u_buff2 ( .Y(ck_buf), .A(i_ck) );

    // -------------------------
    // Lógica jerárquica
    // -------------------------
    wire and_z;       // salida del AND
    wire ck_sel;      // clock seleccionado por el mux dentro de u_mod2
    wire ff1_q;       // Q del registro u_ff1_reg

    u_mod1 u_mod1_inst (
        .i_data1 (i_data1),
        .i_data2 (i_data2),
        .i_sel   (i_sel),
        .ck_div2 (ck_div2),
        .ck_buf  (ck_buf),
        .and_z   (and_z),
        .ck_sel  (ck_sel),
        .ff1_q   (ff1_q)
    );

    // Registros de salida (a la derecha del dibujo)
    // TODO: reemplazar CELL_DFF por tu celda de FF
    DFFHQX2 u_ff2_reg ( .Q(o_data1), .D(ff1_q), .CK(ck_sel) );
    DFFHQX2 u_ff3_reg ( .Q(o_data2), .D(ff1_q), .CK(i_ck)  );

endmodule

// ============================================================
// u_mod1: contiene el AND (u_and) y u_mod2 (MUX de clock + u_ff1_reg)
// ============================================================
module u_mod1 (
    input  wire i_data1,
    input  wire i_data2,
    input  wire i_sel,
    input  wire ck_div2,
    input  wire ck_buf,

    output wire and_z,
    output wire ck_sel,
    output wire ff1_q
);
    // TODO: reemplazar CELL_AND2 por tu celda real
    AND2X2 u_and ( .Y(and_z), .A(i_data1), .B(i_data2) );

    u_mod2 u_mod2_inst (
        .i_sel  (i_sel),
        .ck_a   (ck_div2), // A del mux de clock
        .ck_b   (ck_buf),  // B del mux de clock (atraviesa ambas jerarquías)
        .d_in   (and_z),   // dato a registrar
        .ck_sel (ck_sel),
        .ff1_q  (ff1_q)
    );
endmodule

// ============================================================
// u_mod2: MUX de clock (u_mux) + registro u_ff1_reg
// - u_mux selecciona entre ck_a y ck_b usando i_sel
// - u_ff1_reg: D = d_in, CP = ck_sel
// ============================================================
module u_mod2 (
    input  wire i_sel,
    input  wire ck_a,   // ck_div2
    input  wire ck_b,   // ck_buf
    input  wire d_in,   // salida del AND
    output wire ck_sel, // clock seleccionado hacia u_ff1_reg
    output wire ff1_q
);
    // TODO: reemplazar CELL_CLKMUX2 por la celda de mux de clock de tu lib
    // (p.ej. CKMUX2, CLKMUX_X?, BUFGMUX, etc.)
    CLKMX2X2 u_mux (
        .Y (ck_sel),
        .A (ck_a),
        .B (ck_b),
        .S0 (i_sel)
    );

    // Registro u_ff1_reg
    // TODO: reemplazar CELL_DFF por tu celda real de FF
    DFFHQX2 u_ff1_reg (
        .Q  (ff1_q),
        .D  (d_in),
        .CK (ck_sel)
    );
endmodule

