///@function scr_house_upgrade(abilitysocket)
///@description Purchasing an upgrade for house
///@param abilitysocket

var ability = argument[0]

if o_controller.bank.resource_money < selection.array_abilities_price[selection.house,ability]{
	// ur too poor kid
	
} else {
	//deducting the payment
	o_controller.bank.resource_money = o_controller.bank.resource_money - selection.array_abilities_price[selection.house,ability]
	
	//doing the rest of the purchase/upgrade
	selection.sprite_index = selection.array_abilities_sprite[selection.house,ability]
	selection.house = selection.array_abilities_nextstate[selection.house,ability]
	if selection.ownership == ownership.world {
		selection.ownership = ownership.player	
	}
	
	scr_resource_count()
	
}