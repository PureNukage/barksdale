//Crew Button
draw_set_color(c_back_gray)
draw_roundrect_ext(1109,6,1274,63,2,2,false)
draw_set_color(c_white)

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
		
		if (leftclick) and point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
		954,_y1,1096,_y1+41) {
			if (ds_list_find_value(crews,i) == "New Crew") and (i=0) {  //	Making a new crew
				crews_menu[? "Crews Menu"] = false
				if crews_menu[? "Crew"] == false {	//	Open the Crew menu
					crews_menu[? "Crew"] = true				
				}
				if (ds_list_size(crews) == 1) {	//	If this is the first Crew to be made
					crew[0] = ds_list_create()
					crew[1] = ds_list_create()
				} else {
					scr_crew_create()
				}
				crew_selected = 1	
				ds_list_insert(crews,0,"New Crew")
			} else {													//  Selecting a crew
				crews_menu[? "Crews Menu"] = false
				crews_menu[? "Crew"] = true
				crew_selected = i
			}
		}
		
		_y1 =(_y1+41)+5
		
	}
}

#endregion

#region Crew

if (crews_menu[? "Crew"] == true) {

	var crew_size = ds_list_size(crew[crew_selected])
	
	var _height = (crew_size*34)

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
	
	if (selection != 0) and object_get_name(selection.object_index) == "o_goon" {

	}
	
	var _y = 254
	
	for(var i=0;i<crew_size;i++) {
		draw_set_color(c_front_gray)
		draw_rectangle(1117,_y,1267,_y+35,false)
	}
	
}



#endregion