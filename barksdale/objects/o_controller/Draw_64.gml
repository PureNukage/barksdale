//GUI

//Portrait Box
draw_set_color(c_back_gray)
draw_rectangle(23,462,270,703,false)

//Stats Box
draw_roundrect(277,486,448,703,false)

//Resources
draw_roundrect(9,6,324,51,false)	//total resource window
//draw_roundrect(9,57,324,102,false)	//bank resource window
draw_set_color(c_white)
var bank_money = "$: " + string(o_controller.bank.resource_money)
var bank_product = "product: " + string(o_controller.bank.resource_product)
draw_text(18,10,bank_money)
draw_text(37+string_width(bank_money),10,bank_product)


draw_set_color(c_black)
var money = "$: " + string(resource_money)
var product = "product: " + string(resource_product)
draw_text(18,30,money)
draw_text(37+string_width(money),30,product)




//Draw Debug
if debug == true {
	scr_draw_debug()
}

if selection != 0 {		//If an object is selected
	scr_gui_draw_selection()
}