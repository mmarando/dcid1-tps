`timescale 1ns/1ps

module tb;

  localparam NB        = 8;
  localparam N_CHANGES = 200;
  localparam WAIT_CLK_B = 8;  // margen para el retardo CDC y la fase relativa de los clocks

  reg           i_clock_a;
  reg           i_clock_b;
  reg           i_reset;
  reg           i_sel;
  reg  [NB-1:0] i_coeffs_a;
  reg  [NB-1:0] i_coeffs_b;
  wire [NB-1:0] o_coeffs;

  integer errors;
  integer checks;

  sel_coeffs_sync #(.NB(NB)) dut (
    .i_coeffs_a(i_coeffs_a),
    .i_coeffs_b(i_coeffs_b),
    .i_sel     (i_sel),
    .i_clock_a (i_clock_a),
    .i_clock_b (i_clock_b),
    .i_reset   (i_reset),
    .o_coeffs  (o_coeffs)
  );

  // clock_a: 20 ns
  initial begin
    i_clock_a = 0;
    forever #10 i_clock_a = ~i_clock_a;
  end

  // clock_b: 14 ns
  initial begin
    i_clock_b = 0;
    forever #7 i_clock_b = ~i_clock_b;
  end

  initial begin
    i_reset    = 1;
    i_sel      = 0;
    i_coeffs_a = 8'hAA;
    i_coeffs_b = 8'h55;
    errors     = 0;
    checks     = 0;
    #20;
    i_reset = 0;
  end

  task check_out(input [NB-1:0] expected, input [127:0] tag);
    begin
      checks = checks + 1;
      if (o_coeffs !== expected) begin
        errors = errors + 1;
        $display("ERROR @%0t (%0s): o=%h esperado=%h sel=%b A=%h B=%h src_sel=%b sel_d=%b toggle=%b sync=%b sync_d=%b mux=%h delayed=%h", $time, tag, o_coeffs, expected, i_sel, i_coeffs_a, i_coeffs_b, dut.sel_reg, dut.sel_d, dut.sel_tgl, dut.sel_tgl_b, dut.sel_tgl_b_d, dut.coeffs_mux_reg, dut.coeffs_dly);
      end
    end
  endtask

  initial begin
    @(negedge i_reset);
    repeat (WAIT_CLK_B) @(posedge i_clock_b);
    @(negedge i_clock_b);
    check_out(i_coeffs_a, "reset sel=0");

    repeat (N_CHANGES) begin
      @(negedge i_clock_a);
      i_sel = ~i_sel;
      if (i_sel)
        i_coeffs_b = $urandom;   // solo cambia el banco que pasa a estar seleccionado
      else
        i_coeffs_a = $urandom;
      repeat (WAIT_CLK_B) @(posedge i_clock_b);
      @(negedge i_clock_b);
      check_out(i_sel ? i_coeffs_b : i_coeffs_a, i_sel ? "sel=1" : "sel=0");
    end

    $display("RESULTADO: %0d checks, %0d errores", checks, errors);
    if (errors == 0)
      $display("TEST PASS");
    else
      $display("TEST FAIL");
    $finish;
  end

endmodule
