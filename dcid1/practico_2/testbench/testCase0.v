// ---------------------------------- testcase0.v ----------------------------
`include "i2cSlave_define.v"
`include "i2cSlaveTB_defines.v"

module testCase0();

reg ack;
reg [7:0] data;
reg [15:0] dataWord;
reg [7:0] dataRead;
reg [7:0] dataWrite;
reg [7:0] status;
integer i;
integer j;

// Función para comparar señal con valor esperado
task check_signal;
  input [7:0] signal;       // Señal a comparar
  input [7:0] expected;     // Valor esperado
  begin
      if (signal === expected) begin
        $display("Tiempo %0t: OK: es igual a 0x%h", $time, expected);
      end else begin
        $display("Tiempo %0t: ERROR: no es igual a 0x%h, valor actual = 0x%h", $time, expected, signal);
        $stop;             // Detener simulación
      end
  end
endtask

initial
begin
  $write("\n\n");
  testHarness.reset;
  #1000;

  // Configuracion del entorno
  //   set i2c master clock scale reg PRER = (48MHz / (5 * 400KHz) ) - 1
  $write("Testing register read/write\n");
  testHarness.u_wb_master_model.wb_write(1, `PRER_LO_REG , 8'h17);
  testHarness.u_wb_master_model.wb_write(1, `PRER_HI_REG , 8'h00);
  testHarness.u_wb_master_model.wb_cmp(1, `PRER_LO_REG , 8'h17);

  //  enable i2c master
  testHarness.u_wb_master_model.wb_write(1, `CTR_REG , 8'h80);

  // Test 
  multiByteReadWrite.write({`I2C_ADDRESS, 1'b0}, 8'h00, 32'h89abcdef, `SEND_STOP);
  check_signal(testHarness.u_i2cSlave.myReg0,8'h89);
  check_signal(testHarness.u_i2cSlave.myReg1,8'hab);
  check_signal(testHarness.u_i2cSlave.myReg2,8'hcd);
  check_signal(testHarness.u_i2cSlave.myReg3,8'hef);

  // Lectura
  multiByteReadWrite.read({`I2C_ADDRESS, 1'b0}, 8'h00, 32'h89abcdef, dataWord, `NULL);

  // Otros patrones de datos
  multiByteReadWrite.write({`I2C_ADDRESS, 1'b0}, 8'h00, 32'h00000000, `SEND_STOP); 
  multiByteReadWrite.write({`I2C_ADDRESS, 1'b0}, 8'h00, 32'hffffffff, `SEND_STOP); 
  multiByteReadWrite.write({`I2C_ADDRESS, 1'b0}, 8'h00, 32'hAA55AA55, `SEND_STOP);

  // Acceso a registros 4-7 (solo lectura)
  multiByteReadWrite.read({`I2C_ADDRESS, 1'b0}, 8'h04, 32'h12345678, dataWord, `NULL);

  // Transferencia incorrecta
  multiByteReadWrite.write({7'h3d, 1'b0}, 8'h00, 32'h12345678, `SEND_STOP);
  testHarness.u_wb_master_model.wb_read(1, `SR_REG, status);
  if (status[7] != 1'b1) begin
      $display("ERROR: se esperaba NACK, SR = 0x%h", status);
      $stop;
  end

  $write("Finished all tests\n");
  $stop;	

end

endmodule

