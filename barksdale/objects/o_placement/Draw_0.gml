depth = -10000

//  Switch to determine if goon or crew zone

//  and if the zone has already been started
if (o_controller.goonzone == true) or (o_controller.goonzone == false and !is_array(o_controller.zone_array)) {
	//  Goon zone; turn red if the tile is a building
	//Loop through the zone tiles and draw them red if unwalkable and green if walkable
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
} else if (o_controller.goonzone == false and is_array(o_controller.zone_array)) {
	// Crew zone; not first file; turn red if not touching existing zone
	
}