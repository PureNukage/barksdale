//This script is used for checking the mouse x and y coordinates against the ability buttons x and y

//We are assuming that an object is selected and has abilities

var _returnarray = argument[0]
var ability_total = 0
var current_slot_total = 0
var current_slot_used = 0

if _returnarray == false {
	var _ability = 0
	for(var i=0;i<5;i++) {
		
		switch(object_get_name(selection.object_index)) {
			case "o_goon": ability_total = selection.goonjobs break;	
			case "o_house": ability_total = selection.house break;
			case "o_civilian": exit; break;
		}
		
		if current_slot_total == selection.array_abilities_totals[ability_total] {	
			//We've drawn all the abilities this object has, kill the loop
			i = 5
			current_slot_used = false
		} else {
			if selection.array_abilities_slots[ability_total,i] == 1 { 
				//This slot has an ability, yes
				current_slot_used = true	
				current_slot_total++
			} else {	//This slot does not have an ability
				current_slot_used = false
			}
		}
		
		
		if current_slot_used == true {
		
			if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),gui_ability_button_x1[i],gui_ability_button_y1[i],
			gui_ability_button_x2[i],gui_ability_button_y2[i]) {
				_ability = 1
				_ability[0] = i
				return true
			}
		}
	}	
	return false
} else {
	var _ability = 0
	for(var i=0;i<5;i++) {
		
				switch(object_get_name(selection.object_index)) {
			case "o_goon": ability_total = selection.goonjobs break;	
			case "o_house": ability_total = selection.house break;
		}
		
		if current_slot_total == selection.array_abilities_totals[ability_total] {	
			//We've drawn all the abilities this object has, kill the loop
			i = 5
			current_slot_used = false
		} else {
			if selection.array_abilities_slots[ability_total,i] == 1 { 
				//This slot has an ability, yes
				current_slot_used = true	
				current_slot_total++
			} else {	//This slot does not have an ability
				current_slot_used = false
			}
		}
		
		if current_slot_used == true {
		
			if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),gui_ability_button_x1[i],gui_ability_button_y1[i],
			gui_ability_button_x2[i],gui_ability_button_y2[i]) {
				_ability = 1
				_ability[0] = i
				return _ability
			}
		}
	}
	return false
}