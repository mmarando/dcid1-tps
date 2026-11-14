# Abrir base de datos VCD
database -open -vcd waves -into waves.vcd -default

# Capturar senales del testbench
probe -create tb_fir_par4 -depth all -all -database waves

# Ejecutar simulacion
run

# Finalizar
exit
