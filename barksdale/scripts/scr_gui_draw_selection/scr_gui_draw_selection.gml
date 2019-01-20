//These things are constansts amongst selectable objects
var portrait = selection.portrait
draw_sprite(portrait,0,32,471)		//Drawing portrait

draw_set_color(c_front_gray)
draw_roundrect(285,491,440,522,false)	//Drawing nameplate

draw_set_color(c_front_gray)
draw_roundrect(285,528,359,559,false)	//Drawing (building_type/job) panel
draw_roundrect(366,528,440,559,false)	//Drawing ownership panel
draw_roundrect(285,634,440,698,false)	//Drawing Inventory panel

var ability_loop, draw_text_x, draw_text_y, draw_text_text

switch(object_get_name(selection.object_index))		//Drawing data inside the panels
{
	case "o_goon":
		draw_set_color(c_black)
		draw_text(291,639,"money: " + string(selection.money))
		draw_text(291,661,"product: " + string(selection.product))
		
		draw_set_font(font_name)
		draw_text(290,492,selection.name)		//Drawing name
		draw_set_font(-1)
		
		ability_loop = gui_ability_totalbuttons[selection.object_index]
		
	break;
	case "o_house":
		draw_set_color(c_black)
		draw_text(288,534,selection.building_type)		//Building type
		
		draw_set_font(font_name)
		draw_text(290,492,selection.name[selection.house])		//Drawing name
		draw_set_font(-1)
		
		ability_loop = selection.array_house_abilities_totals[selection.house]
		
	break;
}

for(var i=0;i<ability_loop;i++) {
			
	if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),gui_ability_button_x1[i],
	gui_ability_button_y1[i],gui_ability_button_x2[i],gui_ability_button_y2[i]) {
		scr_gui_draw_tooltip(i,object_get_name(selection.object_index))
		draw_set_color(c_front_gray)	
				
	} else {
		draw_set_color(c_back_gray)	
	}
	draw_roundrect(gui_ability_button_x1[i],gui_ability_button_y1[i],
	gui_ability_button_x2[i],gui_ability_button_y2[i],false)
			
	draw_set_color(c_black)
	if object_get_name(selection.object_index) == "o_house" {
		draw_text(gui_ability_button_x1[i]+3,gui_ability_button_y1[i]+3,selection.array_house_abilities_names[selection.house,i])
	} else {
		draw_text(gui_ability_button_x1[i]+20,gui_ability_button_y1[i]+25,ability_name[selection.object_index,i])
	}
}	