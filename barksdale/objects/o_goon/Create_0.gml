name = "Goon"
portrait = s_portrait_goon
selected = false 

movespeed = 3
goalX = 0
goalY = 0
pos = 0
x_goto = 0
y_goto = 0

abilities = true
inventory = true

resource_money = 0
resource_product = 0

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

//Arrays
//total

goonstates = goonstates.idle
goontasks = goontasks.roam
