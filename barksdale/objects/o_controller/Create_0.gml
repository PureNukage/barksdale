scr_keybinds()
scr_getinputs()
scr_camera_setup()

scr_grid_init()

//Var Init
debug = false
debug_focus = 0
selection = 0
selection_last = 0

resource_money = 500
resource_product = 100

//Abilities
ability_name[o_goon.object_index,0] = "deal"
ability_scr[o_goon.object_index,0] = scr_zone

#region Ability gui areas

gui_ability_button_x1[0] = 283
gui_ability_button_y1[0] = 623
gui_ability_button_x2[0] = gui_ability_button_x1[0] + 79
gui_ability_button_y2[0] = gui_ability_button_y1[0] + 79

//eventually do a for-loop just like debug gui areas, maybe like 4-6 sockets?

#endregion

#region Debug gui areas

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
list_debug_objects = ds_list_create()

enum playerstates {
	free,
	placement,
}

playerstates = playerstates.free

ds_list_insert(list_debug_objects,ds_list_size(list_debug_objects),id)