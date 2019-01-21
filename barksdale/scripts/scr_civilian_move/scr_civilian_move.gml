if point_distance(x,y,x_goto,y_goto) < 8 {
	if ++pos == path_get_number(civilian_path) {	
		civrandom = irandom_range(1,30)
		civstates = civstates.idle		
	} else {
		x_goto = path_get_point_x(civilian_path,pos)
		y_goto = path_get_point_y(civilian_path,pos)
	}
}
		
mp_potential_step(x_goto,y_goto,movespeed,false)