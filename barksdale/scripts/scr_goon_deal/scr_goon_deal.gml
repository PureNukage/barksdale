#region <--------------------------     goonstates     ----------------------------->

switch(goonstates)
{
	case goonstates.idle:
		
		
	break;
	case goonstates.move:
	
	break;
}


#endregion


#region <-----------------------	goonstates-agnostic     ---------------------------->

if resource_product < 15 and skip == false {
	
	goalX = o_controller.bank.x+66
	goalY = o_controller.bank.y+145
	
	current_action = scr_goon_reup
	skip = true
	
		if scr_mp_grid_define_path(x,y,goalX,goalY,goon_path,grid,true) {
		pos = 1
		x_goto = path_get_point_x(goon_path,pos)
		y_goto = path_get_point_y(goon_path,pos)
		goonstates = goonstates.move
	}
} else {
			
	//Selling
	var zone_collision_x2 = start_x+(zone_w*32)
	var zone_collision_y2 = start_y+(zone_h*32)
	if collision_rectangle(start_x,start_y,zone_collision_x2,zone_collision_y2,o_civilian,false,true) 
	and
	point_in_rectangle(x,y,start_x,start_y,zone_collision_x2,zone_collision_y2){
		var customer = collision_rectangle(start_x,start_y,zone_collision_x2,zone_collision_y2,o_civilian,false,true)
		if customer.recently_purchased == false and skip = false {
			
			//refactor this so the customer is walking over on his own will
			with customer {
				goalX = other.x
				goalY = other.y
			
				if scr_mp_grid_define_path(x,y,goalX,goalY,civilian_path,grid,true) {
					pos = 1
					x_goto = path_get_point_x(civilian_path,pos)
					y_goto = path_get_point_y(civilian_path,pos)
					civstates = civstates.move
					other.target_id = customer
					other.skip = true
					other.channel_time = irandom_range(30,240)
				}		
				
			}

		} else if customer.recently_purchased == false and target_id != 0 {
			
			current_channel_time++
			scr_goon_sell(channel_time,current_channel_time)			
			
		}
	
		
	} 
	
}

#endregion