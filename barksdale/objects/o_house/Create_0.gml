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

name[house.vacant] = "Vacant"
name[house.owned] = "Owned"
name[house.safehouse] = "Safehouse"

if ds_list_size(o_controller.list_buildings) == 1 {
	house = house.owned
	sprite_index = s_building_owned
} else {
	house = house.vacant
}

//House Tiers Array
//Ability Totals for each Tier
array_house_abilities_totals[house.vacant] = 0
array_house_abilities_totals[house.owned] = 1
array_house_abilities_totals[house.safehouse] = 0

array_house_abilities_names[house.vacant,0] = "purchase"

array_house_abilities_names[house.owned,0] = "turn into\nsafehouse"

array_house_abilities_names[house.safehouse,0] = "poop"

array_house_abilities_price[house.owned,0] = 200

array_house_abilities_tooltip[house.owned,0] = "A safehouse is used to recruit crew"

