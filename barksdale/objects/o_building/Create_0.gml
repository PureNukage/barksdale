name = "Building"
selected = false
portrait = s_portrait_blank

building_type = "House"

//Add to list of buildings
ds_list_insert(o_controller.list_buildings,ds_list_size(o_controller.list_buildings),id)

ds_list_insert(o_controller.list_debug_objects,ds_list_size(o_controller.list_debug_objects),id)

enum house {
	vacant,
	owned,
	safehouse,
	
}

if ds_list_size(o_controller.list_buildings) == 1 {
	house = house.safehouse
	sprite_index = s_building_owned
} else {
	house = house.vacant
}

//Building Tiers Array

