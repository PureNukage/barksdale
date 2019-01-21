scr_keybinds()
scr_getinputs()
scr_camera_setup()

scr_grid_init()

//Var Init
debug = false
debug_focus = 0
debug_scroll = 0
selection = 0
selection_last = 0

//Time
day_current = current_minute
day_previous = current_minute

dontclick = false

resource_money = 0
bank = 0
resource_product = 0

resource_product_price = 2

enum initial_resource_count {
	building_load,
	count_resources,
	stop_counting
}

initial_resource_count = initial_resource_count.building_load

//GUI Back Color
c_front_gray = make_color_rgb(85,85,85)
c_back_gray = make_color_rgb(54,54,54)

//Ownership
enum ownership {
	player,
	world,
}	

array_ownership[ownership.player] = "You"
array_ownership[ownership.world] = "World"

var civ = instance_create_layer(0,0,"Instances",o_civilian)
gui_ability_totalbuttons[o_civilian.object_index] = 0
with civ { instance_destroy() }

//Zone
zone_w = 0
zone_h = 0
zone_ch = 0
zone_cw = 0

zone_object_index = 0
zone_ability_id = 0

#region Ability gui areas

gui_ability_button_x1[0] = 453
gui_ability_button_y1[0] = 624
gui_ability_button_x2[0] = gui_ability_button_x1[0] + 79
gui_ability_button_y2[0] = gui_ability_button_y1[0] + 79


for(var i=1;i<5;i++) {
	gui_ability_button_x1[i] = (gui_ability_button_x2[i-1])+5
	gui_ability_button_y1[i] = 624
	gui_ability_button_x2[i] = (gui_ability_button_x1[i] + 79)
	gui_ability_button_y2[i] = gui_ability_button_y1[0] + 79
}

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