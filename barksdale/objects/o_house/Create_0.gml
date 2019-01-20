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

ownership = ownership.world

name[house.vacant] = "Vacant"
name[house.owned] = "Owned"
name[house.safehouse] = "Safehouse"

if ds_list_size(o_controller.list_buildings) == 1 {
	ownership = ownership.player
	house = house.owned
	sprite_index = s_building_house_owned
} else {
	house = house.vacant
}

//House Abilities

//Vacant 
array_house_abilities_totals[house.vacant] = 1
//Purchase House $100
array_house_abilities_scr[house.vacant,0] = scr_house_purchase
array_house_abilities_names[house.vacant,0] = "Purchase"
array_house_abilities_price[house.vacant,0] = 100
array_house_abilities_sprite[house.vacant,0] = s_building_house_owned 
array_house_abilities_nextstate[house.vacant,0] = house.owned
array_house_abilities_tooltip[house.vacant,0] = "Guaranteed to have that fresh new\nhouse smell"

//Owned
array_house_abilities_totals[house.owned] = 1
//Turn into Safehouse $200
array_house_abilities_scr[house.owned,0] = scr_house_purchase
array_house_abilities_names[house.owned,0] = "turn into\nsafehouse"
array_house_abilities_price[house.owned,0] = 200	
array_house_abilities_sprite[house.owned,0] = s_building_house_safehouse
array_house_abilities_nextstate[house.owned,0] = house.safehouse
array_house_abilities_tooltip[house.owned,0] = "A safehouse is used to recruit crew"

//Safehouse
array_house_abilities_totals[house.safehouse] = 0


