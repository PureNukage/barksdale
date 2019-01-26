///@function scr_leftclick_ability()
///@description If we're clicking an ability, use the ability and return true, else return false

if selection != 0 {

	var ability_total = 0
	var current_slot_total = 0
	var current_slot_used = 0

	for(var i=0;i<5;i++) {
	
		//	Getting which tier/job the unit is
		
		switch(object_get_name(selection.object_index)) {
			case "o_goon": ability_total = selection.goonjobs break;	
			case "o_house": ability_total = selection.house break;
			case "o_civilian": exit; break;
		}
	
		//	This loops through the current abilities that the unit has available to them
		//	If the current ability socket does indeed have an ability, then current_slot_true = false
		//	and we check if the mouse is clicking on it
		
		if current_slot_total == selection.array_abilities_totals[ability_total] {	//
			//We've drawn all the abilities this object has, kill the loop
			current_slot_used = false
			return false
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
			
				//	We ARE clicking on the ability! Now let's execute the ability!
			
				switch(object_get_name(selection.object_index))
				{
					case "o_goon":
						script_execute(selection.array_abilities_scr[selection.goonjobs,i],selection.object_index,i)
					break;
					case "o_house":
						script_execute(selection.array_abilities_scr[selection.house,i],i)
					break;
				}
			
				return true
			
			}	
		}
	}	
	
}

