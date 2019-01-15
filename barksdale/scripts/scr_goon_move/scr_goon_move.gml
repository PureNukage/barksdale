if point_distance(x,y,x_goto,y_goto) < 8 {
	if ++pos == path_get_number(goon_path) {	
		goonstates = goonstates.idle
	} else {
		x_goto = path_get_point_x(goon_path,pos)
		y_goto = path_get_point_y(goon_path,pos)
	}
}
		
mp_potential_step(x_goto,y_goto,movespeed,false)