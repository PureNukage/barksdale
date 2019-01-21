if dontclick == true {		//If just coming from scr_zone, don't EventHandle the first frame
	dontclick = false
	exit;
}

if (rightclick) {
	if instance_exists(o_placement) {
		with o_placement { instance_destroy() }
	}
	if selection.array_abilities_color_toggle != -1 {
		selection.array_abilities_colors[selection.array_abilities_color_toggle] = 0
		selection.array_abilities_color_toggle = -1
	}
	playerstates = playerstates.free	
}
	
if (leftclick) {			// i believe this only works with the deal ability, not sure
	if instance_exists(o_placement) {	
		var placement = o_placement.id
	}
	
	with selection 
	{
		goalX = mouse_x
		goalY = mouse_y
		
		//Passing along zone vars from from o_controller // and start_x and start_y vars from o_placement
		zone_h = other.zone_h
		zone_w = other.zone_w
		zone_ch = other.zone_ch
		zone_cw = other.zone_cw
		start_x = placement.start_x
		start_y = placement.start_y
		zone_array = scr_zone_green_array()
		
		if scr_mp_grid_define_path(x,y,goalX,goalY,goon_path,grid,true) {
			pos = 1
			x_goto = path_get_point_x(goon_path,pos)
			y_goto = path_get_point_y(goon_path,pos)
			goonstates = goonstates.move
			goontasks = goontasks.deal
		}
	}	
	if instance_exists(o_placement) {
		with o_placement { instance_destroy() }
	}
	
	if selection.array_abilities_color_toggle != -1 {
	selection.array_abilities_colors[selection.array_abilities_color_toggle] = 0
	selection.array_abilities_color_toggle = -1
	}
	
	playerstates = playerstates.free	
	zone_h = 0
	zone_w = 0
	zone_ch = 0
	zone_cw = 0
	zone_array = 0
}
