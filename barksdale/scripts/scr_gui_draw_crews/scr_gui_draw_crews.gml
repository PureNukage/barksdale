//Crew Button
draw_set_color(c_back_gray)
draw_roundrect_ext(1109,6,1274,63,2,2,false)
draw_set_color(c_white)
draw_set_font(roboto_regular_20)
draw_text(1150,20,"Crews")
draw_set_font(-1)

#region Crews Menu

if (crews_menu[? "Crews Menu"] == true) {
	draw_set_color(c_back_gray)
	var window_size = (ds_list_size(crews)*47)+5
	draw_roundrect_ext(948,6,1103,6+window_size,2,2,false)
	var _y1 = 11
	for(var i=0;i<ds_list_size(crews);i++) {
		draw_set_color(c_front_gray)
		draw_roundrect_ext(954,_y1,1096,_y1+41,2,2,false)
		draw_set_color(c_white)
		draw_set_halign(fa_center)
		draw_set_font(roboto_condensed_12)
		draw_text(1030,_y1+12,ds_list_find_value(crews,i))
		draw_set_font(-1)
		draw_set_halign(fa_left)
		
		_y1 =(_y1+41)+5
		
	}
}

#endregion

#region Crew

if (crews_menu[? "Crew"] == true) {

	var crew_size = ds_list_size(crew[crew_selected])
	
	var _height = (crew_size*35)

	draw_set_color(c_back_gray)
	draw_roundrect(1109,157,1274,253+_height,false)
	
	draw_set_color(c_front_gray)
	draw_rectangle(1115,164,1267,197,false)				//	Crew Name plate
	draw_rectangle(1115,203,1267,236,false)				//	Settings plate
	
	
	draw_set_color(c_white)
	draw_set_font(roboto_condensed_12)
	draw_set_halign(fa_center)
	draw_text(1191,169,crews[| crew_selected])			//	Crew Name text
	draw_text(1191,208,"Settings")						//	Settings text
	draw_set_font(-1)
	draw_set_halign(fa_left)
	
	var _y = 254
	
	for(var i=1;i<crew_size+1;i++) {
		var _id = ds_list_find_value(crew[crew_selected],i-1)
		if selection == _id {
			draw_set_color(c_selected_gray)	
		} else {
			draw_set_color(c_front_gray)
		}
		draw_rectangle(1117,_y,1267,_y+29,false)
		draw_set_color(c_white)		
		draw_text(1125,_y+5,_id.name)
		_y = _y+(i*29)+5
	}
	
	if (selection !=0 and object_get_name(selection.object_index) == "o_goon") {
		if selection.crew != crew_selected {
			_y = _y+5
			draw_set_color(c_front_gray)
			draw_roundrect(1117,_y,1267,_y+35,false)
			draw_set_color(c_white)
			draw_set_font(roboto_condensed_12)
			draw_set_halign(fa_center)
			draw_text(1200,_y+8,selection.name)
			draw_set_halign(fa_left)
			draw_set_font(-1)
		}
	}	
	
}



#endregion