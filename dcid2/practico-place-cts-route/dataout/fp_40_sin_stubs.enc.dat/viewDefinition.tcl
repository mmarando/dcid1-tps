if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast_vdd1v0_basicCells_hvt.lib\
    ${::IMEX::libVar}/mmmc/fast_vdd1v0_basicCells.lib\
    ${::IMEX::libVar}/mmmc/fast_vdd1v0_basicCells_lvt.lib]
create_library_set -name slow\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow_vdd1v0_basicCells_hvt.lib\
    ${::IMEX::libVar}/mmmc/slow_vdd1v0_basicCells.lib\
    ${::IMEX::libVar}/mmmc/slow_vdd1v0_basicCells_lvt.lib]
create_rc_corner -name early_spef_rcworst_125\
   -preRoute_res 0.91\
   -postRoute_res {0.95 0.95 1}\
   -preRoute_cap 1.00225\
   -postRoute_cap {0.961163 0.961163 1}\
   -postRoute_xcap {0.874 0.874 1}\
   -preRoute_clkres 0.985\
   -preRoute_clkcap 0.912\
   -postRoute_clkcap {0.857375 0.857375 1}\
   -postRoute_clkres {0.9785 0.9785 1}\
   -T 125\
   -qx_tech_file ${::IMEX::libVar}/mmmc/early_spef_rcworst_125/qrcTechFile
create_rc_corner -name late_spef_rcworst_125\
   -preRoute_res 0.91\
   -postRoute_res {0.95 0.95 1}\
   -preRoute_cap 1.10775\
   -postRoute_cap {1.06234 1.06234 1}\
   -postRoute_xcap {0.874 0.874 1}\
   -preRoute_clkres 0.985\
   -preRoute_clkcap 1.008\
   -postRoute_clkcap {0.947625 0.947625 1}\
   -postRoute_clkres {0.9785 0.9785 1}\
   -T 125\
   -qx_tech_file ${::IMEX::libVar}/mmmc/early_spef_rcworst_125/qrcTechFile
create_rc_corner -name early_spef_rcbest_0\
   -preRoute_res 0.91\
   -postRoute_res {0.95 0.95 1}\
   -preRoute_cap 1.00225\
   -postRoute_cap {0.961163 0.961163 1}\
   -postRoute_xcap {0.874 0.874 1}\
   -preRoute_clkres 0.985\
   -preRoute_clkcap 0.912\
   -postRoute_clkcap {0.857375 0.857375 1}\
   -postRoute_clkres {0.9785 0.9785 1}\
   -T 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/early_spef_rcbest_0/qrcTechFile
create_rc_corner -name late_spef_rcbest_0\
   -preRoute_res 0.91\
   -postRoute_res {0.95 0.95 1}\
   -preRoute_cap 1.10775\
   -postRoute_cap {1.06234 1.06234 1}\
   -postRoute_xcap {0.874 0.874 1}\
   -preRoute_clkres 0.985\
   -preRoute_clkcap 1.008\
   -postRoute_clkcap {0.947625 0.947625 1}\
   -postRoute_clkres {0.9785 0.9785 1}\
   -T 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/early_spef_rcbest_0/qrcTechFile
create_delay_corner -name setup_rcworst\
   -library_set slow\
   -late_rc_corner late_spef_rcworst_125\
   -early_rc_corner early_spef_rcworst_125
create_delay_corner -name hold_rcbest\
   -library_set fast\
   -late_rc_corner late_spef_rcbest_0\
   -early_rc_corner early_spef_rcbest_0
create_constraint_mode -name func\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/fir_serial_parallel_m.sdc]
create_analysis_view -name func_hold_ff1p1v_0c_rcbest -constraint_mode func -delay_corner hold_rcbest
create_analysis_view -name func_setup_ss0p9v_125c_rcworst -constraint_mode func -delay_corner setup_rcworst
set_analysis_view -setup [list func_setup_ss0p9v_125c_rcworst] -hold [list func_hold_ff1p1v_0c_rcbest]
