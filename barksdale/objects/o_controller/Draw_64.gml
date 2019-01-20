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
	scr_gui_draw_selection()
}