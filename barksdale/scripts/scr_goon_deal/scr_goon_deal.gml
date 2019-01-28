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
	
	goalX = o_controller.crew_stash[crew].x
	goalY = o_controller.crew_stash[crew].y
	
	current_action = scr_goon_reup
	skip = true
	
	if scr_mp_grid_define_path(x,y,goalX,goalY,goon_path,grid,true) {
		pos = 1
		x_goto = path_get_point_x(goon_path,pos)
		y_goto = path_get_point_y(goon_path,pos)
		goonstates = goonstates.move
	}	
	
	//goalX = o_controller.bank.x+66
	//goalY = o_controller.bank.y+145
	
	//current_action = scr_goon_reup
	//skip = true
	
	//	if scr_mp_grid_define_path(x,y,goalX,goalY,goon_path,grid,true) {
		//	pos = 1
		//	x_goto = path_get_point_x(goon_path,pos)
		//	y_goto = path_get_point_y(goon_path,pos)
		//	goonstates = goonstates.move
		//}
} else {
			
	if crew == -1 {
		//  Selling solo
		var zone_collision_x2 = start_x+(zone_w*32)
		var zone_collision_y2 = start_y+(zone_h*32)
		if collision_rectangle(start_x,start_y,zone_collision_x2,zone_collision_y2,o_civilian,false,true) 
		and
		point_in_rectangle(x,y,start_x,start_y,zone_collision_x2,zone_collision_y2){
			var customer = collision_rectangle(start_x,start_y,zone_collision_x2,zone_collision_y2,o_civilian,false,true)
			if customer.recently_purchased == false {
			
				scr_goon_sell()
				customer.recently_purchased = true	

			} 	
		
		} 
		exit;
	} else {
		
		//  Selling in a crew
		
		for(var i=0;i<ds_list_size(o_controller.crew_zone_x[crew])-1;i++) {
			var list_x = o_controller.crew_zone_x[crew]
			var list_y = o_controller.crew_zone_y[crew]
			var start_x = ds_list_find_value(list_x,i)
			var start_y = ds_list_find_value(list_y,i)
			if collision_rectangle(start_x,start_y,start_x+31,start_y+31,o_civilian,false,true) {
				var customer = collision_rectangle(start_x,start_y,start_x+31,start_y+31,o_civilian,false,true)
				if customer.recently_purchased == false {
					scr_goon_sell()
					customer.recently_purchased = true
				}
			}
			
		}
		
	}
	
}

#endregion