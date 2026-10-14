# Abrir base de datos VCD
database -open -vcd waves -into waves.vcd -default

# Capturar señales del testbench
probe -create tb_multiplicador \
    -depth all \
    -all \
    -database waves

# Ejecutar simulacion
run

# Finalizar
exit