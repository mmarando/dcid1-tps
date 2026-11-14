# set cells


# buildign boundary cells

#set_well_tap_mode -reset
#setEndCapMode -reset 
#
#set endcap_prefix ENDCAP
#setEndCapMode -useEvenOddSite none
## sides
#setEndCapMode -rightEdge         $endcap_right_edge
#setEndCapMode -leftEdge          $endcap_left_edge
#setEndCapMode -bottomEdge        $endcap_bottom_edge
#setEndCapMode -topEdge           $endcap_top_edge
## corners
#setEndCapMode -leftTopCorner     $endcap_left_top_corner
#setEndCapMode -leftBottomCorner  $endcap_left_bottom_corner
## Top/Bottom edge
#setEndCapMode -rightTopEdge      $endcap_right_top_edge
#setEndCapMode -rightBottomEdge   $endcap_right_bottom_edge
#
#setEndCapMode -min_vertical_channel_width 48
#setEndCapMode -min_jog_width 10
#setEndCapMode -min_horizontal_channel_width 10
#setEndCapMode -min_jog_height 3
#
#addEndCap -prefix $endcap_prefix
