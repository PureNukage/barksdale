//GUI

//Portrait Box
draw_set_color(c_gray)
draw_rectangle(23,462,270,703,false)

//Nameplate
draw_rectangle(283,539,650,614,false)

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
		draw_set_color(c_black)
		draw_set_halign(fa_middle)
		draw_set_font(batang_64)
		draw_text(477,548,selection.name)
		draw_set_font(-1)
		draw_set_halign(fa_left)
	} else { 
		draw_text(477,487,"No name")
	}
	//Drawing Abilities
	if variable_instance_exists(selection,"abilities") {
		draw_set_color(c_gray)
		draw_roundrect(gui_ability_button_x1[0],gui_ability_button_y1[0],
		gui_ability_button_x2[0],gui_ability_button_y2[0],false)
		
		draw_set_color(c_black)
		draw_text(gui_ability_button_x1[0]+20,gui_ability_button_y1[0]+25,ability_name[selection.object_index,0])
	}
}