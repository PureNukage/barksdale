var zone_array

//Loop through the zone
for(var w=0;w<zone_w;w++) {
	for(var h=0;h<zone_h;h++) {
		if collision_rectangle(start_x+(w*32),start_y+(h*32),start_x+((w*32)+31),start_y+((h*32)+31),o_house,false,true) {
			zone_array[w,h] = 0			
		} else {
			zone_array[w,h] = 1
		}
				
	}
}

return zone_array