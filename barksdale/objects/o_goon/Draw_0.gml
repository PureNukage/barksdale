draw_self()

if selected == true {
	draw_set_color(c_white)
	draw_circle(x-1,y-1,16,true)
	
	if goontasks = goontasks.deal {
		for(var w=0;w<zone_w;w++) {
			for(var h=0;h<zone_h;h++) {
				if collision_rectangle(start_x+(w*32),start_y+(h*32),start_x+((w*32)+31),start_y+((h*32)+31),o_building,false,true) {
					draw_set_color(c_red)
				} else {
					draw_set_alpha(.5)
					draw_set_color(c_green)
					draw_rectangle(start_x+(w*32),start_y+(h*32),start_x+((w*32)+31),start_y+((h*32)+31),false)	
					draw_set_alpha(1)
				}
			}
		}	
	}
	
}