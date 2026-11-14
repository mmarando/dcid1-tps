proc create_tracks_from_db {} {
    foreach lyr [get_db layers -if {.name =~*Metal*}] {
        set name [get_db $lyr .name]
        set dir  [string tolower [get_db $lyr .direction]]   ;# horizontal|vertical
	if { $dir == "horizontal"} {
        set p    [get_db $lyr .pitch_x]                        ;# {px py} o {p}
        set off  [get_db $lyr .offset_x]                       ;# {ox oy} o {o}

        # Normalizar a 2 valores por las dudas
        if {[llength $p]   == 1} { set p   [list [lindex $p 0] ] }
        if {[llength $off] == 1} { set off [list [lindex $off 0] ] }

        puts "[format {Layer=%-7s dir=%-9s pitch=%s offset=%s} $name $dir $p $off]"

        add_tracks -layer $name -direction $dir -pitch $p -offset $off
	} elseif { $dir == "vertical" } {
        set p    [get_db $lyr .pitch_y]                        ;# {px py} o {p}
        set off  [get_db $lyr .offset_y]                       ;# {ox oy} o {o}

        # Normalizar a 2 valores por las dudas
        if {[llength $p]   == 1} { set p   [list [lindex $p 0] ] }
        if {[llength $off] == 1} { set off [list [lindex $off 0] ] }

        puts "[format {Layer=%-7s dir=%-9s pitch=%s offset=%s} $name $dir $p $off]"

        add_tracks -layer $name -direction $dir -pitch $p -offset $off
	}

    }
}

