///@function scr_gui_draw_tooltip(abilitysocket,object_name)
///@description Draws tooltip for an ability
///@param abilitysocket
///@param object_name

var ability = argument[0]
var object = argument[1]

draw_set_color(c_back_gray)
draw_roundrect(23,325,448,456,false)
draw_set_color(c_front_gray)
draw_rectangle(29,330,442,451,false)

switch(object)
{
	case "o_house":
		draw_set_color(c_black)
		draw_text(43,343,selection.array_abilities_tooltip[selection.house,ability])
		
		//is this is an upgrade, draw the price too
		if selection.array_abilities_type[selection.house,ability] != type.ability {
			draw_text(390,420,"$"+string(selection.array_abilities_price[selection.house,ability]))
		} else {
				
		}
	
	break;
}