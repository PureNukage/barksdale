scr_getinputs()

scr_camera()

scr_leftclick()

scr_rightclick()

switch(playerstates)
{
	case playerstates.placement: scr_player_placement() break;	
}

if (debug_focus + (arrowright-arrowleft)) == -1 or debug_focus + (arrowright-arrowleft) == ds_list_size(list_debug_objects)  {
	debug_focus = debug_focus
} else {
	debug_focus += (arrowright-arrowleft)	
}

if (debug_scroll + (arrowdown_down-arrowup_down)) == -100 {
	debug_scroll = debug_scroll
} else {
	debug_scroll += (arrowdown_down-arrowup_down)*5	
}

if debugtoggle {
	debug = !debug
}
