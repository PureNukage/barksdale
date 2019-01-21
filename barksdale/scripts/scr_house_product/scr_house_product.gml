var ability = argument[0]

var price, resource, qty

price = selection.array_abilities_price[selection.house,ability]

resource = selection.array_abilities_resource[selection.house,ability]

qty = selection.array_abilities_resource_qty[selection.house,ability]

var real_resource = 0

switch(resource)
{
	case "resource_product": o_controller.bank.resource_product += qty break;
}


//payment
o_controller.bank.resource_money -= price

scr_resource_count()