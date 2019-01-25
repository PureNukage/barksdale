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
			if ds_list_find_value(crews,i) == "New Crew" {  //	Making a new crew
				if crews_menu[? "Crew"] == false { 
					crews_menu[? "Crew"] = true				
				}
				crews_menu[? "Crews Menu"] = false
				ds_list_insert(crews,0,"New Crew")
			} else {	//  Selecting a previously existing crew
				crews_menu[? "Crews Menu"] = false
				crews_menu[? "Crew"] = true
			}
		}
		
		_y1 =(_y1+41)+5
		
	}
}

#endregion

#region Crew

draw_set_color(c_back_gray)
draw_roundrect(11095,157,1274,253,false)

var 



#endregion