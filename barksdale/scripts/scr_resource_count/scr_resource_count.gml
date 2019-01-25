//This script should be called anytime money or resources of the players are touched

o_controller.resource_money = 0			//	These prevent us from adding onto the current amount and  
o_controller.resource_product = 0		//	gaining resources out of thin air (instead of adjusting just
										//  the amount transacted)

for(var i=0;i<ds_list_size(o_controller.list_debug_objects);i++) {
	var _id = ds_list_find_value(o_controller.list_debug_objects,i)
	
	if (variable_instance_exists(_id,"ownership") and _id.ownership == ownership.player) {
		o_controller.resource_money += _id.resource_money
		o_controller.resource_product += _id.resource_product
	}		
	
}