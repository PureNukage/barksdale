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
		draw_text(43,343,selection.array_house_abilities_tooltip[selection.house,ability])
		draw_text(390,420,"$"+string(selection.array_house_abilities_price[selection.house,ability]))
	
	break;
}