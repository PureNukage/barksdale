//Random x and y
var finished_loop = false

while finished_loop == false {
	var random_x = irandom_range(0,zone_w)
	var random_y = irandom_range(0,zone_h)

	if (zone_array[random_x,random_y] == 1) {
		finished_loop = true	
		
		var array = 0
		
		array[0] = start_x+(random_x*32)+16
		array[1] = start_y+(random_y*32)+16
		
		return array
		
	} else {
		finished_loop = false
	}
	
}

