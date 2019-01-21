#region <--------------------------------          WALKING			------------------------------------------->
	
if point_distance(x,y,x_goto,y_goto) < 8 {
	if ++pos == path_get_number(goon_path) {	
		
		if current_action != 0 {
			script_execute(current_action)	
		} else {
			goonstates = goonstates.idle
		}
		
	} else {
		x_goto = path_get_point_x(goon_path,pos)
		y_goto = path_get_point_y(goon_path,pos)
	}
}
		
mp_potential_step(x_goto,y_goto,movespeed,false)

#endregion