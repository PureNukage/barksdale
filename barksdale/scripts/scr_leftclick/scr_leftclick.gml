///@function scr_leftclick()
///@description 
///@param 


/*
	This code is currently used with "o_controller". 
	
	The function is used to select objects on the screen with a leftclick.
																								*/
																								
//Gui layer click

if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),gui_debug_button_x1[0],gui_debug_button_y1[0],
													 gui_debug_button_x2[0],gui_debug_button_y2[0])
	and debug == true) {
	//If clicking on debug button 1
	scr_civilian_spawn()
	exit;
}

if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),1109,6,1274,63)) { 
	crews_menu[? "Crews Menu"] = !crews_menu[? "Crews Menu"]
	exit;
}

if (selection != 0 and scr_abilityclick()) { 
	exit;
}
																								
																								
if (instance_position(mouse_x,mouse_y,all)) {		//	If clicking any object
	
	if (selection != 0 and selection.selected == true) {		//  We already have an object selected
		selection.selected = false								//  de-select it
	}
	
	selection_last = selection
	selection = instance_position(mouse_x,mouse_y,all)			//  Store the recently-selected objects id

	if variable_instance_exists(selection,"selected") {			//  If this is an object we can select
		selection.selected = !selection.selected				//	Select / de-Select it
		if selection_last == selection {
			selection.selected = false
			selection = 0
		}
	} else {													//	If not a selectable object
		selection.selected = false								//	De-Select
		selection = 0											//  Clear 'selection' of value
		
	}
} else if (!instance_position(mouse_x,mouse_y,all)) {		//	If not clicking an object
	if (selection != 0 and selection.selected == true) {				//	We already have any object selected
		selection.selected = false
		selection = 0
	}
	selection = 0														//	Clear 'selection' of value
} 
