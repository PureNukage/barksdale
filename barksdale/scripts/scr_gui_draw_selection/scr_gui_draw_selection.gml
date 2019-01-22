//These things are constansts amongst selectable objects
var portrait = selection.portrait
draw_sprite(portrait,0,32,471)		//Drawing portrait

draw_set_color(c_front_gray)
draw_roundrect(285,491,440,522,false)	//Drawing nameplate

draw_set_color(c_front_gray)
draw_roundrect(285,528,359,559,false)	//Drawing (building_type/job) panel
draw_roundrect(366,528,440,559,false)	//Drawing ownership panel
draw_roundrect(285,634,440,698,false)	//Drawing Inventory panel

draw_set_color(c_black)
draw_set_halign(fa_middle)
draw_text(403,534,array_ownership[selection.ownership])
draw_set_halign(fa_left)

var ability_loop

switch(object_get_name(selection.object_index))		//Drawing data inside the panels
{
	case "o_goon":
		draw_set_color(c_black)
		draw_text(291,639,"money: " + string(selection.resource_money))
		draw_text(291,661,"product: " + string(selection.resource_product))
		
		draw_text(288,534,selection.job[selection.goonjobs])
		
		draw_set_font(font_name)
		draw_text(290,492,selection.name)		//Drawing name
		draw_set_font(-1)
		
		ability_loop = gui_ability_totalbuttons[selection.object_index]
		
	break;
	case "o_house":
		draw_set_color(c_black)
		draw_text(291,639,"money: " + string(selection.resource_money))
		draw_text(291,661,"product: " +string(selection.resource_product))
		
		draw_text(288,534,selection.building_type)		//Building type
		
		draw_set_font(font_name)
		draw_text(290,492,selection.name[selection.house])		//Drawing name
		draw_set_font(-1)
		
		ability_loop = selection.array_abilities_totals[selection.house]
		
	break;
	case "o_civilian":
		draw_set_color(c_black)
		draw_set_font(font_name)
		draw_text(290,492,selection.name)		//Drawing name
		draw_set_font(-1)
	
		ability_loop = 0
	break;
}

#region <--------------------         DRAWING ABILITIES        ------------------------------------------->

var current_slot_used = false
var current_slot_total = 0
var ability_total = 0

for(var i=0;i<5;i++) {
		
	//    <---- is this ability slot set?     ----->  
	
	switch(object_get_name(selection.object_index)) {	
		case "o_goon": ability_total = selection.goonjobs break;
		case "o_house": ability_total = selection.house break;
		case "o_civilian": exit; break;
	}
	
	if current_slot_total == selection.array_abilities_totals[ability_total] {	
		//We've drawn all the abilities this object has, kill the loop
		i = 5
		current_slot_used = false
	} else {
		if selection.array_abilities_slots[ability_total,i] == 1 { 
			//This slot has an ability, yes
			current_slot_used = true	
			current_slot_total++
		} else {	//This slot does not have an ability
			current_slot_used = false
		}
	}
	
	if current_slot_used == true {
		
		if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),gui_ability_button_x1[i],
		gui_ability_button_y1[i],gui_ability_button_x2[i],gui_ability_button_y2[i]) {
			scr_gui_draw_tooltip(i,object_get_name(selection.object_index))

		}
	
		if (selection.array_abilities_color_toggle == i or selection.array_abilities_colors[i] == true){
			draw_set_color(c_front_gray)			
		} else {
			draw_set_color(c_back_gray)	
		}
		draw_roundrect(gui_ability_button_x1[i],gui_ability_button_y1[i],
		gui_ability_button_x2[i],gui_ability_button_y2[i],false)
			
		draw_set_color(c_black)
		if object_get_name(selection.object_index) == "o_house" {
			var ability_name = selection.house
		} else {
			var ability_name = selection.goonjobs
		}
		draw_text(gui_ability_button_x1[i]+3,gui_ability_button_y1[i]+3,selection.array_abilities_names[ability_name,i])
		
	}
}	

#endregion