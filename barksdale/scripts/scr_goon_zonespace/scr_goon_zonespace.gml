//Random x and y
if is_array(zone_array) {
	var finished_loop = false

	while finished_loop == false {
		var random_x = irandom_range(0,zone_w-1)
		var random_y = irandom_range(0,zone_h-1)

		if (zone_array[random_x,random_y] == 1) {
			finished_loop = true	
		
			var array = 0
		
			array[0] = start_x+(random_x*32)+15
			array[1] = start_y+(random_y*32)+15
		
			return array
		
		} else {
			finished_loop = false
		}
	
	}
} else {
	
	//  Crew zone
	var random_x = irandom_range(0,ds_list_size(o_controller.crew_zone_x[crew])-1)
	var random_y = irandom_range(0,ds_list_size(o_controller.crew_zone_y[crew])-1)
	
	var array = 0
	array[0] = ds_list_find_value(o_controller.crew_zone_x[crew],random_x)+15
	array[1] = ds_list_find_value(o_controller.crew_zone_y[crew],random_y)+15
	
	return array
	
}	

