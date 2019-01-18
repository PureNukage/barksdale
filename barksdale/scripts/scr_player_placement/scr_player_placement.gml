if dontclick == true {		//If just coming from scr_zone, don't EventHandle the first frame
	dontclick = false
	exit;
}

if (rightclick) {
	if instance_exists(o_placement) {
		with o_placement { instance_destroy() }
	}
	playerstates = playerstates.free	
}

if (leftclick) {
	with selection 
	{
		goalX = mouse_x
		goalY = mouse_y
		if scr_mp_grid_define_path(x,y,goalX,goalY,goon_path,grid,true) {
			pos = 1
			x_goto = path_get_point_x(goon_path,pos)
			y_goto = path_get_point_y(goon_path,pos)
			goonstates = goonstates.move
		}
	}	
	if instance_exists(o_placement) {
	with o_placement { instance_destroy() }
	}
	playerstates = playerstates.free	
}
