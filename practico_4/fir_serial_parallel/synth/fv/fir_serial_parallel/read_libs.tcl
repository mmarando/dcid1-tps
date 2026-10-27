add_search_path . ./lib /home/amslib/PDKs/gpdk045v6/gsclib045_hvt/timing /home/amslib/PDKs/gpdk045v6/gsclib045_lvt/timing /home/amslib/PDKs/gpdk045v6/gsclib045/timing -library -both
read_library -liberty -both \
    /home/amslib/PDKs/gpdk045v6/gsclib045_hvt/timing/slow_vdd1v0_basicCells_hvt.lib \
    /home/amslib/PDKs/gpdk045v6/gsclib045/timing/slow_vdd1v0_basicCells.lib \
    /home/amslib/PDKs/gpdk045v6/gsclib045_lvt/timing/slow_vdd1v0_basicCells_lvt.lib \
    /home/amslib/PDKs/gpdk045v6/gsclib045_hvt/timing/slow_vdd1v0_basicCells_hvt.lib \
    /home/amslib/PDKs/gpdk045v6/gsclib045/timing/slow_vdd1v0_basicCells.lib \
    /home/amslib/PDKs/gpdk045v6/gsclib045_lvt/timing/slow_vdd1v0_basicCells_lvt.lib

