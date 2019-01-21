depth = -50
for(var w=0;w<o_controller.zone_w;w++) {
	for(var h=0;h<o_controller.zone_h;h++) {
		if collision_rectangle(start_x+(w*32),start_y+(h*32),start_x+((w*32)+31),start_y+((h*32)+31),o_house,false,true) {
			draw_set_color(c_red)
		} else {
			draw_set_color(c_green)	
		}
		draw_rectangle(start_x+(w*32),start_y+(h*32),start_x+((w*32)+31),start_y+((h*32)+31),false)	
	}
}