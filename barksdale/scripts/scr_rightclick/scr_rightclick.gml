if (rightclick and selection != 0) {
	// Object specific code at this point is a no-no; refactor this at some point
	if object_get_name(selection.object_index) == "o_goon" {
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
	}
}