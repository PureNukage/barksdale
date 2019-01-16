scr_camera_setup()

scr_grid_init()

//Var Init
debug = false
selection = 0
selection_last = 0

#region Macros

//Debug gui areas
gui_debug_button_x1[0] = 792
gui_debug_button_y1[0] = 250
gui_debug_button_x2[0] = gui_debug_button_x1[0] + 59
gui_debug_button_y2[0] = gui_debug_button_y1[0] + 59

gui_debug_button_text[0] = "spawn"

gui_debug_totalbuttons = 6
for(var i=1;i<gui_debug_totalbuttons;i++) {
	gui_debug_button_x1[i] = gui_debug_button_x2[i-1] - 8
	gui_debug_button_y1[i] = gui_debug_button_y2[i-1] - 8
	gui_debug_button_x2[i] = gui_debug_button_x1[0] + 59
	gui_debug_button_y2[i] = gui_debug_button_y1[0] + 59
}

#endregion

list_buildings = ds_list_create()

