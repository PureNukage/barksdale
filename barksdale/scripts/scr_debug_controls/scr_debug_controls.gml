
if (debug == true) {	//	I don't want to check for inputs if the debug console isn't on

	//	If the next debug object is outside of the list, don't go further and crash obviously
	//  Otherwise go to the next debug object, either higher or lower in the list

	if (debug_focus + (arrowright-arrowleft)) == -1 or debug_focus + (arrowright-arrowleft) == ds_list_size(list_debug_objects)  {
		debug_focus = debug_focus
	} else {
		debug_focus += (arrowright-arrowleft)	
	}

	//	Scroll the variable list up or down the debug console window

	if (debug_scroll + (arrowdown_down-arrowup_down)) == -100 {
		debug_scroll = debug_scroll
	} else {
		debug_scroll += (arrowdown_down-arrowup_down)*5	
	}
	
}

//	Turn debug on or off

if debugtoggle {
	debug = !debug		
}