selected = false
portrait = s_portrait_blank

building_type = "House"

resource_money = 0
resource_product = 0

//Add to list of buildings
ds_list_insert(o_controller.list_buildings,ds_list_size(o_controller.list_buildings),id)

ds_list_insert(o_controller.list_debug_objects,ds_list_size(o_controller.list_debug_objects),id)

enum house {
	vacant,
	owned,
	safehouse,
	
}

enum type {
	upgrade,
	ability,
	purchase
}

ownership = ownership.world

name[house.vacant] = "Vacant"
name[house.owned] = "Owned"
name[house.safehouse] = "Safehouse"

#region House Abilities

//Color Toggle
for(var i=0;i<5;i++) {
	array_abilities_colors[i] = false	
}
//Colors
array_abilities_color_toggle = -1
array_abilities_color_toggle_last = -1

#region Vacant 
array_abilities_totals[house.vacant] = 1
array_abilities_slots[house.vacant,0] = 1
//Purchase House $100
array_abilities_scr[house.vacant,0] = scr_house_purchase
array_abilities_type[house.vacant,0] = type.upgrade
array_abilities_names[house.vacant,0] = "Purchase"
array_abilities_price[house.vacant,0] = 100
array_abilities_sprite[house.vacant,0] = s_building_house_owned 
array_abilities_nextstate[house.vacant,0] = house.owned
array_abilities_tooltip[house.vacant,0] = "Guaranteed to have that fresh new\nhouse smell"

#endregion

#region Owned

array_abilities_totals[house.owned] = 2
array_abilities_slots[house.owned,0] = 1
array_abilities_slots[house.owned,1] = 0
array_abilities_slots[house.owned,2] = 1
//Turn into Safehouse $200
array_abilities_scr[house.owned,0] = scr_house_purchase
array_abilities_type[house.owned,0] = type.upgrade
array_abilities_names[house.owned,0] = "turn into\nsafehouse"
array_abilities_price[house.owned,0] = 200	
array_abilities_sprite[house.owned,0] = s_building_house_safehouse
array_abilities_nextstate[house.owned,0] = house.safehouse
array_abilities_tooltip[house.owned,0] = "A safehouse is used to recruit crew"

//Bank
array_abilities_scr[house.owned,2] = scr_house_bank
array_abilities_type[house.owned,2]= type.ability
array_abilities_names[house.owned,2] = "bank"
array_abilities_tooltip[house.owned,2] = "Payments for the organization be pulled\nfrom this property"

#endregion

#region Safehouse
array_abilities_totals[house.safehouse] = 2
array_abilities_slots[house.safehouse,0] = 0
array_abilities_slots[house.safehouse,1] = 1
array_abilities_slots[house.safehouse,2] = 1

//Buy more product
array_abilities_scr[house.safehouse,1] = scr_house_product
array_abilities_type[house.safehouse,1] = type.purchase
array_abilities_names[house.safehouse,1] = "buy\nproduct"
array_abilities_price[house.safehouse,1] = 150
array_abilities_resource[house.safehouse,1] = "resource_product"
array_abilities_resource_qty[house.safehouse,1] = 100
array_abilities_tooltip[house.safehouse,1] = "Buy 100 more product"

//Bank
array_abilities_scr[house.safehouse,2] = scr_house_bank
array_abilities_type[house.safehouse,2]= type.ability
array_abilities_names[house.safehouse,2] = "bank"
array_abilities_tooltip[house.safehouse,2] = "Payments for the organization be pulled\nfrom this property"


#endregion


#endregion

//  <-----     STARTER HOUSE  ----->
if ds_list_size(o_controller.list_buildings) == 1 {
	
	ownership = ownership.player
	house = house.owned
	sprite_index = s_building_house_owned
	resource_money = 500
	resource_product = 100
	o_controller.bank = id
	array_abilities_colors[2] = true
	
} else {
	house = house.vacant
}


