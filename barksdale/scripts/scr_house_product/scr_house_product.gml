var ability = argument[0]

var price, resource, qty

price = selection.array_abilities_price[selection.house,ability]

resource = selection.array_abilities_resource[selection.house,ability]

qty = selection.array_abilities_resource_qty[selection.house,ability]

var real_resource = 0

// can i pay ?
if o_controller.bank.resource_money < price {
	
} else {
	o_controller.bank.resource_money -= price
	
	switch(resource)
	{
		case "resource_product": o_controller.bank.resource_product += qty break;
		case "o_goon": instance_create_layer(o_controller.bank.x+50,o_controller.bank.y+150,"Instances",o_goon) break;
	}

	scr_resource_count()
	
}



