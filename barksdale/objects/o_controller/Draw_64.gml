//GUI

//Portrait Box
draw_set_color(c_gray)
draw_rectangle(23,462,270,703,false)

//Nameplate
draw_rectangle(282,476,650,551,false)

//Draw Debug
if debug == true {
	scr_draw_debug()
}

if selection != -1 { 
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
		draw_text(477,487,selection.name)
		draw_set_font(-1)
		draw_set_halign(fa_left)
	} else { 
		draw_text(477,487,"No name")
	}
}