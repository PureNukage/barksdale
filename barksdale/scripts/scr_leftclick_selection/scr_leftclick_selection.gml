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