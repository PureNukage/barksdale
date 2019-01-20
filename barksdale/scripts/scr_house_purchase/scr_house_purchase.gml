var ability = argument[0]

if o_controller.resource_money < selection.array_house_abilities_price[selection.house,ability]{
	// ur too poor kid
	
} else {
	//deducting the payment 
	o_controller.resource_money = o_controller.resource_money - selection.array_house_abilities_price[selection.house,ability]
	
	//doing the rest of the purchase/upgrade
	selection.sprite_index = selection.array_house_abilities_sprite[selection.house,ability]
	selection.house = selection.array_house_abilities_nextstate[selection.house,ability]
	if selection.ownership == ownership.world {
		selection.ownership = ownership.player	
	}
}