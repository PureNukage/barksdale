scr_getinputs()

scr_camera()

scr_leftclick()

scr_rightclick()

if (debug_focus + (arrowright-arrowleft)) == -1 or debug_focus + (arrowright-arrowleft) == ds_list_size(list_debug_objects)  {
	debug_focus = debug_focus
} else {
	debug_focus += (arrowright-arrowleft)	
}

if debugtoggle {
	debug = !debug
}
