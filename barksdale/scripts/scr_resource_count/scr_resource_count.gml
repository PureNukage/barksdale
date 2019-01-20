for(var i=0;i<ds_list_size(o_controller.list_debug_objects);i++) {
	var _id = ds_list_find_value(o_controller.list_debug_objects,i)
	
	if (variable_instance_exists(_id,"ownership") and _id.ownership == ownership.player) {
		o_controller.resource_money += _id.resource_money
		o_controller.resource_product += _id.resource_product
	}		
	
}