//	Toggle Crews Menu Open

if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),1109,6,1274,63)) { 
	crews_menu[? "Crews Menu"] = !crews_menu[? "Crews Menu"]	
	return true
} 

//Crews Menu Click
if (crews_menu[? "Crews Menu"] == true) {
	var window_size = (ds_list_size(crews)*47)+5
	if point_in_rectangle(gui_x,gui_y,948,6,1103,6+window_size) {	//  Clicking inside Crews Menu
		
		var _y1 = 11
		
		for(var i=0;i<ds_list_size(crews);i++) {
			if point_in_rectangle(gui_x,gui_y,954,_y1,1096,_y1+41) {
				if (ds_list_find_value(crews,i) == "New Crew") and (i=0) {  //	Making a new crew
					crews_menu[? "Crews Menu"] = false
					if crews_menu[? "Crew"] == false {	//	Open the Crew menu
						crews_menu[? "Crew"] = true				
					}
					if (ds_list_size(crews) == 1) {	//	If this is the first Crew to be made
						crew[0] = ds_list_create()
						crew[1] = ds_list_create()
					} else {
						scr_crew_create()
					}
					crew_selected = 1	
					ds_list_insert(crews,0,"New Crew")
				} else {													//  Selecting a crew
					crews_menu[? "Crews Menu"] = false
					crews_menu[? "Crew"] = true
					crew_selected = i
				}	
				return true
			}
			
			_y1 =(_y1+41)+5
			
		}
		return true
	}
	
}

//Crew 
if (crews_menu[? "Crew"] == true) {
	
	var crew_size = ds_list_size(crew[crew_selected])
	
	var _height = (crew_size*35)
	
	if point_in_rectangle(gui_x,gui_y,1109,157,1274,253+_height) {
	
		//Changing Name of Crew
		if point_in_rectangle(gui_x,gui_y,1115,164,1267,197) {
			crews[| crew_selected] = get_string("Crew Name:","")	
			return true
		}		
	
		var _y = 254	
		for(var i=1;i<crew_size+1;i++) {		// Checking if we're clicking a goon
			if point_in_rectangle(gui_x,gui_y,1117,_y,1267,_y+29) {
				if (selection != 0 and selection.selected == true) { 
					selection.selected = false
				}
				selection_last = selection
				selection = ds_list_find_value(crew[crew_selected],i-1)
				selection.selected = !selection.selected
				if selection_last == selection {
					selection.selected = false	
					selection = 0
				}
				return true
			}
			_y = _y+(i*29)+5
		}	
		
		return true
	
		}			
	var _y=254
	for(var i=1;i<crew_size+1;i++) {
		_y = _y+(i*29)+5	
	}
	
	//	If you have a goon selected
	if (selection !=0 and object_get_name(selection.object_index) == "o_goon") {	
		if selection.crew != crew_selected {
			_y = _y+5
			if point_in_rectangle(gui_x,gui_y,1117,_y,1267,_y+35,) {	//	Adding Goon to this crew
				selection.crew = crew_selected
				ds_list_insert(crew[crew_selected],0,selection.id)
				return true
			}
		}
	}	
	
}

crews_menu[? "Crews Menu"] = false