var zone_collision_x2 = start_x+(zone_w*32)
var zone_collision_y2 = start_y+(zone_h*32)
if collision_rectangle(start_x,start_y,zone_collision_x2,zone_collision_y2,o_civilian,false,true) {
	var customer = collision_rectangle(start_x,start_y,zone_collision_x2,zone_collision_y2,o_civilian,false,true)
	if customer.recently_purchased == false {
		o_controller.resource_money += 20
		o_controller.resource_product -= 10
		customer.recently_purchased = true
	}
}