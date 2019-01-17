//This script is used for checking the mouse x and y coordinates against the ability buttons x and y

//We are assuming that an object is selected and has abilities

var _returnarray = argument[0]

if _returnarray == false {
	var _ability = 0
	for(var i=0;i<1;i++) {
		if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),gui_ability_button_x1[i],gui_ability_button_y1[i],
		gui_ability_button_x2[i],gui_ability_button_y2[i]) {
			_ability = 1
			_ability[0] = i
			return true
		}
	}	
	return false
} else {
	var _ability = 0
	for(var i=0;i<1;i++) {
		if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),gui_ability_button_x1[i],gui_ability_button_y1[i],
		gui_ability_button_x2[i],gui_ability_button_y2[i]) {
			_ability = 1
			_ability[0] = i
			return _ability
		}
	}
	return false
}