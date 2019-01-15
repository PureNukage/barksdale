draw_set_color(c_gray)
draw_rectangle(792,6,1274,243,false)


if (selection != -1) {
	draw_set_color(c_black)	
	var variable_array = variable_instance_get_names(selection)
	var _x = 870
	var _y = 16
	for(var i=0;i<array_length_1d(variable_array);i++) {
		draw_text(_x,_y,variable_array[i] + ": " + string(variable_instance_get(selection,variable_array[i])))
		_y += 16
	}
}



