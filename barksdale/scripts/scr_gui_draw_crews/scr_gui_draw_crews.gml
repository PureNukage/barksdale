//Crew Button
draw_set_color(c_back_gui)
draw_roundrect_ext(1109,6,1274,63,2,2,false)
draw_set_color(c_white)
draw_set_font(roboto_regular_20)
draw_text(1150,20,"Crews")
draw_set_font(-1)

#region Crews Menu

if (crews_menu[? "Crews Menu"] == true) {
	draw_set_color(c_back_gui)
	var window_size = (ds_list_size(crews)*47)+5
	draw_roundrect_ext(948,6,1103,6+window_size,2,2,false)
	var _y1 = 11
	for(var i=0;i<ds_list_size(crews);i++) {
		draw_set_color(c_front_gui)
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
	
	if crews_menu[? "Members"] == true {
		var crew_size = ds_list_size(crew[crew_selected])
		var _height = (crew_size*40)
	} else if crews_menu[? "Settings"] == true {
		var number_of_settings = 2
		var _height = (number_of_settings*40)
	} else {
		var _height = 0	
	}

	draw_set_color(c_back_gui)
	draw_roundrect(1109,157,1274,288+_height,false)
	
	draw_set_color(make_color_rgb(85,86,98))
	draw_rectangle(1115,164,1267,197,false)				//	Crew Name plate
	
	if crews_menu[? "Members"] == true {
		draw_set_color(c_selected_gui)
	} else draw_set_color(c_front_gui)
	draw_rectangle(1115,203,1267,236,false)				//	Members plate
	if crews_menu[? "Settings"] == true {
		draw_set_color(c_selected_gui)
	} else draw_set_color(c_front_gui)
	draw_rectangle(1115,242,1267,275,false)				//	Settings plate
	
	
	draw_set_color(c_white)
	draw_set_font(roboto_condensed_12)
	draw_set_halign(fa_center)
	draw_text(1191,169,crews[| crew_selected])			//	Crew Name text
	draw_text(1191,208,"Members")						//	Members text
	draw_text(1191,247,"Settings")						//	Settings text
	draw_set_font(-1)
	draw_set_halign(fa_left)
	
	if crews_menu[? "Members"] == true {
	
		//	Drawing the members of this crew
		var _y = 294
		for(var i=1;i<crew_size+1;i++) {
			var _id = ds_list_find_value(crew[crew_selected],i-1)
			if selection == _id {
				draw_set_color(c_selected_gui)	
			} else {
				draw_set_color(c_front_gui)
			}
			draw_roundrect(1117,_y,1267,_y+29,false)
			draw_set_color(c_white)		
			draw_text(1125,_y+5,_id.name)
			_y = _y+(i*29)+5
		}
	} else if crews_menu[? "Settings"] == true {
		
		//	Drawing the settings this crew has 
		var _y = 294
		for(var i=1;i<number_of_settings+1;i++) {
			
			//Settings:Stash
			if i == 1 and crews_menu[? "Settings:Stash"] == true {
				draw_set_color(c_selected_gui)
			} else draw_set_color(c_front_gui)
			
			if i == 2 and crews_menu[? "Settings:Zone"] == true {
				draw_set_color(c_selected_gui)	
			} else if i == 2 and crews_menu[? "Settings:Zone"] = false {
				draw_set_color(c_front_gui)
			}
			
			draw_roundrect(1117,_y,1267,_y+29,false)
			draw_set_color(c_white)
			switch(i) {
				case 1: 
					if crew_stash[crew_selected] != 0 {
						draw_text(1125,_y+5,"stash: Set")
					} else {
						draw_text(1125,_y+5,"stash: none")	
					}				
				break;
				case 2: draw_text(1125,_y+5,"place zone")
			}
			_y = _y+(i*29)+5
			
		}
		
		//Drawing Stash menu
		if crews_menu[? "Settings:Stash"] == true {
			draw_set_color(c_back_gui)
			var menu_height = ((ds_list_size(list_crew_settings_stash))*35)-35
			draw_roundrect(938,294,1103,333+menu_height,false)
			var stash_y = 299
			for(var c=0;c<ds_list_size(list_crew_settings_stash);c++) {
				var house_id = ds_list_find_value(list_crew_settings_stash,c)
				if house_id.stash == crew_selected {
					draw_set_color(c_selected_gui)	
				} else draw_set_color(c_front_gui)
				draw_roundrect(946,stash_y,1096,stash_y+29,false)
				draw_set_color(c_white)
				draw_set_halign(fa_center)
				var stash_name = house_id.building_type + " - " + house_id.name[house_id.house]
				draw_text(1022,stash_y+6,string(stash_name))	
				draw_set_halign(fa_left)
				stash_y = stash_y+34
			}
		}		
		
	} else {
		var _y = 294
	}	
	
	if (selection !=0 and object_get_name(selection.object_index) == "o_goon") {
		if selection.crew != crew_selected {
			_y = _y+5
			draw_set_color(c_front_gui)
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