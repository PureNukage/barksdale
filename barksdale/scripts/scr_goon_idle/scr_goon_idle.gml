if crew != -1 {
	if (o_controller.crew_stash[crew] != 0 and ds_list_size(o_controller.crew_zone_x[crew]) != 0) {
		//	My crew has a stash house and selling zones set! Let's get to work! 
	
		//	I am out of product! Let me go pickup some more from the stash house
		if resource_product < 15 {
			var stashhouse = o_controller.crew_stash[crew]
			goalX = stashhouse.x+66
			goalY = stashhouse.y+145
			if scr_mp_grid_define_path(x,y,goalX,goalY,goon_path,mp_grid,true) {
				pos = 1
				x_goto = path_get_point_x(goon_path,pos)
				y_goto = path_get_point_y(goon_path,pos)
				current_action = scr_goon_reup
				goonstates = goonstates.move
			}
		}
	}
}