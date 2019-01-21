//handling the goods
//var channel_time = argument[0]
//var current_channel_time = argument[1]

//if current_channel_time == channel_time {			//We are done making the transaction!
	//random product/money amount
	
	var random_amount = irandom_range(3,10)
	
	if resource_product >= random_amount {
		
		resource_product -= random_amount
		resource_money += random_amount * o_controller.resource_product_price
		
		scr_resource_count()
		
	}
	
//}



