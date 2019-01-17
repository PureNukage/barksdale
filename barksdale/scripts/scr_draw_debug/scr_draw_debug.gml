draw_set_color(c_gray)
draw_rectangle(792,6,1274,243,false)

draw_rectangle(gui_debug_button_x1[0],gui_debug_button_y1[0],gui_debug_button_x2[0],gui_debug_button_y2[0],false)
draw_set_color(c_black)
draw_text(gui_debug_button_x1[0]+2,gui_debug_button_y1[0]+2,gui_debug_button_text[0])

draw_set_color(c_black)	
var _debug_focus = ds_list_find_value(list_debug_objects,debug_focus)
var variable_array = variable_instance_get_names(_debug_focus)
var _x = 870
var _y = 16
for(var i=0;i<array_length_1d(variable_array);i++) {
	draw_text(_x,_y,variable_array[i] + ": " + string(variable_instance_get(_debug_focus,variable_array[i])))
	_y += 16
}




