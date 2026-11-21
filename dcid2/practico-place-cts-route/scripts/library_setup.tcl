



set lib(ss0p9v125c,liblist) {/home/amslib/PDKs/gpdk045v6/gsclib045_hvt/timing/slow_vdd1v0_basicCells_hvt.lib \
                                        /home/amslib/PDKs/gpdk045v6/gsclib045/timing/slow_vdd1v0_basicCells.lib \
                                        /home/amslib/PDKs/gpdk045v6/gsclib045_lvt/timing/slow_vdd1v0_basicCells_lvt.lib}

set lib(ff1p1v0c,liblist) {/home/amslib/PDKs/gpdk045v6/gsclib045_hvt/timing/fast_vdd1v0_basicCells_hvt.lib \
                                        /home/amslib/PDKs/gpdk045v6/gsclib045/timing/fast_vdd1v0_basicCells.lib \
                                        /home/amslib/PDKs/gpdk045v6/gsclib045_lvt/timing/fast_vdd1v0_basicCells_lvt.lib}


set tech_lef "/home/amslib/PDKs/gpdk045v6/gsclib045_tech/lef/gsclib045_tech.lef"

set lef(lef_files) [list \
	$tech_lef \
	/home/amslib/PDKs/gpdk045v6/gsclib045_hvt/lef/gsclib045_hvt_macro.lef \
	/home/amslib/PDKs/gpdk045v6/gsclib045/lef/gsclib045_macro.lef \
	/home/amslib/PDKs/gpdk045v6/gsclib045_lvt/lef/gsclib045_lvt_macro.lef \
	]
