name = "Goon"
portrait = s_portrait_goon
selected = false 

movespeed = 3
goalX = 0
goalY = 0
pos = 0
x_goto = 0
y_goto = 0

//Dealing times
channel_time = 0
current_channel_time = 0

//Zone stuff
zone_ch = 0
zone_cw = 0
zone_h = 0
zone_w = 0
zone_array = 0

resource_money = 0
resource_product = 0

enum goonjobs {
	hopper
}

skip = false

current_action = 0

job[goonjobs.hopper] = "Hopper"

//Target
target_id = 0
target_x = 0
target_y = 0

//Ability Arrays
//Colors
for(var i=0;i<5;i++) {
	array_abilities_colors[i] = false	
}
//Color Toggle (only one at a time, think active-use)
array_abilities_color_toggle = -1
array_abilities_color_toggle_last = -1

//Hopper
array_abilities_totals[goonjobs.hopper] = 1
array_abilities_slots[goonjobs.hopper,0] = 1

//Deal
array_abilities_scr[goonjobs.hopper,0] = scr_zone
array_abilities_names[goonjobs.hopper,0] = "deal"

//Ownership
ownership = ownership.player

ds_list_insert(o_controller.list_debug_objects,ds_list_size(o_controller.list_debug_objects),id)

goon_path = path_add()

enum goonstates {
	idle,
	move,
}	

enum goontasks {
	roam,
	deal,
}

goonjobs = goonjobs.hopper
goonstates = goonstates.idle
goontasks = goontasks.roam
