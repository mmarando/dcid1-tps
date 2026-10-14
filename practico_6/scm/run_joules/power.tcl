read_mmmc ../mmmc.tcl
read_hdl ../multiplicador.v -language v2001
::legacy::set_attribute lef_library { /home/mmarando/RAK/DATA/LIBRARIES/gsclib045_v3.5/lef/gsclib045_tech.lef }
::legacy::set_attribute cap_table_file {/home/mmarando/RAK/DATA/CAPTABLE/cln28hpl_1p10m+alrdl_5x2yu2yz_typical.capTbl}
::legacy::set_attribute hdl_track_filename_row_col true /
elaborate
init_design
power_map -effort medium
read_stimulus -file ../run_actividad/waves.vcd -format vcd -dut_instance tb_multiplicador.dut -design_root multiplicador -frame_count 10 -append
compute_power -frequency_scale_factor 1 -mode time_based
report_power -widget -collate frames -format %0.3f -unit mW -by_category
