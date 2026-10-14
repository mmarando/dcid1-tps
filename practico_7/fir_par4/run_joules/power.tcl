read_mmmc ../mmmc.tcl
read_hdl ../rtl/fir_parallel.sv ../rtl/fir_instance.sv ../rtl/fir_par4_top.sv -language sv
::legacy::set_attribute lef_library { /home/mmarando/RAK/DATA/LIBRARIES/gsclib045_v3.5/lef/gsclib045_tech.lef }
::legacy::set_attribute cap_table_file {/home/mmarando/RAK/DATA/CAPTABLE/cln28hpl_1p10m+alrdl_5x2yu2yz_typical.capTbl}
::legacy::set_attribute hdl_track_filename_row_col true /
elaborate fir_par4_top
init_design
power_map -effort medium
read_stimulus -file ../run_actividad/waves.vcd -format vcd -dut_instance tb_fir_par4.dut -design_root fir_par4_top -frame_count 10 -append
compute_power -frequency_scale_factor 1 -mode time_based
report_power -frames {/stim#1/frame#[0:9]} -collate frames -format %0.3f -unit mW -by_category
report_power -frames {/stim#1/frame#[0:9]} -collate none -format %0.3f -unit mW -by_category -out frames.rpt