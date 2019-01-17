///@function scr_selection()
///@description 
///@param 


/*
	This code is currently used with "o_controller". 
	
	The function is used to select objects on the screen with a leftclick.
																								*/
																								
//Gui layer click

if (leftclick and point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),gui_debug_button_x1[0],gui_debug_button_y1[0],
													 gui_debug_button_x2[0],gui_debug_button_y2[0])
	and debug == true) {
	//If clicking on debug button 1
	scr_civilian_spawn()
	exit;
}

if (leftclick and selection != 0 and scr_gui_abilityclick(false)) {
	var _ability = scr_gui_abilityclick(true)	
	var _ability_number = _ability[0]
	script_execute(ability_scr[selection.object_index,_ability_number],selection.object_index,_ability_number)
	exit;
}
																								
																								
if (leftclick and instance_position(mouse_x,mouse_y,all)) {		//	If clicking any object

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
} else if (leftclick and !instance_position(mouse_x,mouse_y,all)) {		//	If not clicking an object
	if (selection != 0 and selection.selected == true) {				//	We already have any object selected
		selection.selected = false	
	}
	selection = 0														//	Clear 'selection' of value
} 