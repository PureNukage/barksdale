scr_getinputs()

scr_camera()

if (leftclick and instance_position(mouse_x,mouse_y,all)) {		//	If clicking any object
	
	if (selection != -1 and selection.selected == true) {		//  We already have an object selected 
		selection.selected = false								//  de-select it
	}
	
	selection = instance_position(mouse_x,mouse_y,all)			//  Store the selected objects id
	
	if variable_instance_exists(selection,"selected") {			//  If this is an object we can select
		selection.selected = !selection.selected				//	Select / de-Select it
	} else {													//	If not a selectable object
		selection.selected = false								//	De-Select
		selection = -1											//  Clear 'selection' of value
		
	}
} else if (leftclick and !instance_position(mouse_x,mouse_y,all)) {		//	If not clicking an object
	if (selection != -1 and selection.selected == true) {				//	We already have any object selected
		selection.selected = false	
	}
	selection = -1														//	Clear 'selection' of value
} 

if debugtoggle {
	debug = !debug
}