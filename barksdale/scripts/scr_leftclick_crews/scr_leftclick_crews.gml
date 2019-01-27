//	Toggle Crews Menu Open

if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),1109,6,1274,63)) { 
	crews_menu[? "Crews Menu"] = !crews_menu[? "Crews Menu"]	
	return true
} 

#region Crews Menu Click

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
						crew_stash[0] = 0
						crew_stash[1] = 0
					} else {
						scr_crew_create()
					}
					crew_selected = 1	
					ds_list_insert(crews,0,"New Crew")
				} else {													//  Selecting a crew
					if crews_menu[? "Crew"] == true and crew_selected == i {	//	Crew already open, close out of Crew menu
						crews_menu[? "Crew"] = false
						crew_selected = -1
						crews_menu[? "Crews Menu"] = false
					} else {
						crews_menu[? "Crews Menu"] = false
						crews_menu[? "Crew"] = true
						crew_selected = i
					}
				}	
				return true
			}
			
			_y1 =(_y1+41)+5
			
		}
		return true
	}
	
}

#endregion

#region Crew Click

if (crews_menu[? "Crew"] == true) {
	
	if crews_menu[? "Members"] == true {
		var crew_size = ds_list_size(crew[crew_selected])
		var _height = (crew_size*40)
	} else if crews_menu[? "Settings"] == true {
		var number_of_settings = 2
		var _height = (number_of_settings*40)
	} else {
		var crew_size = 0
		var number_of_settings = 0
		var _height = 0	
	}
	
	if point_in_rectangle(gui_x,gui_y,1109,157,1274,288+_height) {
	
		//Changing Name of Crew
		if point_in_rectangle(gui_x,gui_y,1115,164,1267,197) {
			crews[| crew_selected] = get_string("Crew Name:",crews[| crew_selected])	
			return true
		}		
		
		//Clicking Members
		if point_in_rectangle(gui_x,gui_y,1115,203,1267,236) {
			crews_menu[? "Members"] = !crews_menu[? "Members"]
			crews_menu[? "Settings"] = false
			return true
		}
		
		//Clicking Settings
		if point_in_rectangle(gui_x,gui_y,1115,242,1267,275) {
			crews_menu[? "Settings"] = !crews_menu[? "Settings"]
			crews_menu[? "Members"] = false
			return true
		}
		
		if crews_menu[? "Members"] == true {
			var _y = 294	
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
		} else if crews_menu[? "Settings"] == true {
			var _y = 294
			for(var i=1;i<number_of_settings+1;i++) {
				if point_in_rectangle(gui_x,gui_y,1117,_y,1267,_y+29) {
					if i == 1 {
						scr_crew_settings_stash()	//	Clicking on stash ability
						return true
					}
					if i == 2 {					//	Placing zone
						scr_crew_settings_zone()
						return true
					}
				}
				_y = _y+(i*29)+5	
				
			}
			
		}
	
	return true
			
	}		
	
	//	Stash Menu
	if crews_menu[? "Settings:Stash"] == true {
		var menu_height = ((ds_list_size(list_crew_settings_stash))*35)-35
		if point_in_rectangle(gui_x,gui_y,938,294,1103,333+menu_height) {
			var stash_y = 299
			for(var c=0;c<ds_list_size(list_crew_settings_stash);c++) {
				var house_id = ds_list_find_value(list_crew_settings_stash,c)
				if point_in_rectangle(gui_x,gui_y,946,stash_y,1096,stash_y+29) {
					
					//	If we're clicking a menu-item house we own 
					if crew_stash[crew_selected] != 0 {
						//  Already have a stash for this crew! Deselecting it
						crew_stash[crew_selected].stash = -1
						crew_stash[crew_selected] = 0
					} 
					if crew_stash[crew_selected] == house_id {
						//  This is our stash already, deselect 
						crew_stash[crew_selected] = 0
						house_id.stash = -1
						return true
					} else {
						// Select Stash
						crew_stash[crew_selected] = house_id
						house_id.stash = crew_selected					
						return true
					}	
				}
				
				stash_y = stash_y+34
			}
			return true	
		} else {
			crews_menu[? "Settings:Stash"] = false	
		}
	}	
	
	if crews_menu[? "Members"] == true {
		var _y=294
		for(var i=1;i<crew_size+1;i++) {
			_y = _y+(i*29)+5	
		}
	} else if crews_menu[? "Settings"] == true {
		var _y = 294
		for(var i=1;i<number_of_settings+1;i++) {
			_y = _y+(i*29)+5	
		}
	} else {
		_y = 294	
	}
	
	
	//	If you have a goon selected
	if (selection !=0 and object_get_name(selection.object_index) == "o_goon") {	
		if selection.crew != crew_selected {
			_y = _y+5
			if point_in_rectangle(gui_x,gui_y,1117,_y,1267,_y+35,) {	//	Adding Goon to this crew
				//Check if this goon is in a crew already
				if (selection.crew != -1) {
					var pos = ds_list_find_index(crew[selection.crew],selection)
					ds_list_delete(crew[selection.crew],pos)
				}	
				selection.crew = crew_selected
				ds_list_insert(crew[crew_selected],0,selection.id)
				return true
			}
		}
	}	
	
}

#endregion

crews_menu[? "Crews Menu"] = false