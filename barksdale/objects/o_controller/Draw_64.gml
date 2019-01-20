//GUI

//Portrait Box
draw_set_color(c_back_gray)
draw_rectangle(23,462,270,703,false)

//Stats Box
draw_roundrect(277,486,448,703,false)

//Resources
draw_roundrect(9,6,324,51,false)
draw_set_color(c_black)
var money = "money: " + string(resource_money)
draw_text(20,20,money)

var product = "product: " + string(resource_product)
draw_text(40+string_width(money),20,product)



//Draw Debug
if debug == true {
	scr_draw_debug()
}

if selection != 0 {		//If an object is selected
	if variable_instance_exists(selection,"portrait") {
		var portrait = selection.portrait
		draw_sprite(portrait,0,32,471)	
	} else {
		draw_text(150,150,"No portrait")	
	}
	
	if variable_instance_exists(selection,"name") {
		
		draw_set_color(c_front_gray)
		draw_roundrect(285,491,440,522,false)
		
		draw_set_color(c_black)
		draw_set_font(font_name)
		draw_text(290,492,selection.name)
		draw_set_font(-1)
	} else { 
		draw_text(477,487,"No name")
	}
	
	draw_set_color(c_front_gray)
	draw_roundrect(285,528,359,559,false)
	draw_roundrect(366,528,440,559,false)
	
	if variable_instance_exists(selection,"building_type") {
		draw_set_color(c_black)
		draw_text(288,534,selection.building_type)	
	}
	
	if variable_instance_exists(selection,"inventory") {
		draw_set_color(c_front_gray)
		draw_roundrect(285,634,440,698,false)
		
		draw_set_color(c_black)
		draw_text(291,639,"money: " + string(selection.money))
		draw_text(291,661,"product: " + string(selection.product))
	} 
	
	
	//Drawing Abilities
	if variable_instance_exists(selection,"abilities") {	
		for(var i=0;i<gui_ability_totalbuttons[selection.object_index];i++) {
			
			if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),gui_ability_button_x1[i],
			gui_ability_button_y1[i],gui_ability_button_x2[i],gui_ability_button_y2[i]) {
				draw_set_color(c_front_gray)	
			} else {
				draw_set_color(c_back_gray)	
			}
			draw_roundrect(gui_ability_button_x1[i],gui_ability_button_y1[i],
			gui_ability_button_x2[i],gui_ability_button_y2[i],false)
			
			draw_set_color(c_black)
			draw_text(gui_ability_button_x1[i]+20,gui_ability_button_y1[i]+25,ability_name[selection.object_index,i])
		}
	}
}