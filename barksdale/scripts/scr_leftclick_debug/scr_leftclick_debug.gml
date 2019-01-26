if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),gui_debug_button_x1[0],gui_debug_button_y1[0],
													 gui_debug_button_x2[0],gui_debug_button_y2[0])
	and debug == true) {
	//If clicking on debug button 1
	scr_civilian_spawn()
	return true
} else {
	return false	
}