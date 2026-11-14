source scripts/cell.tcl

#setEcoMode -updateTiming false 
#setEcoMode -batchMode true 
setEcoMode -honorFixedStatus false 
setEcoMode -honorDontUse false 
setEcoMode -honorDontTouch false 
#setEcoMode -refinePlace false

#set lvinsts [dbGet -p2 top.insts.cell.name *LVT*]

#if {[lindex $lvinsts 0] != 0x0} {

  foreach instp [get_db insts .name] {

  
   swap_inst_to_svt $instp

#  set instn [dbget $instp.name] 

 #   set newcell [regsub LVT [dbget $instp.cell.name] "SVT"]

#    ecoChangeCell -inst $instn -cell $newcell

#  }

}
