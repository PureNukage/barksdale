//if variable_instance_exists(id,"crew_zone_x") {
//	var size = ds_list_size(crew_zone_x[crew_selected])
	if crews_menu[? "Settings:Zone"] == true and ds_list_size(crew_zone_x[crew_selected]){
		depth = 5
		for(var i=0;i<ds_list_size(crew_zone_x[crew_selected]);i++) {
			var _x = ds_list_find_value(crew_zone_x[crew_selected],i)
			var _y = ds_list_find_value(crew_zone_y[crew_selected],i)
			draw_set_color(c_green)
			draw_rectangle(_x,_y,_x+31,_y+32,false)
		}
	}
//}

