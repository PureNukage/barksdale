///@function scr_zone(object_index,abilitysocket)
///@description This script is called an ability using 'zoning' is used
///@param object_index
///@param abilitysocket

var _object_index = argument[0]
var _ability_number = argument[1]

switch(object_get_name(_object_index))
{
	case "o_goon":
		switch(_ability_number)
		{
			case 0:
				selection.array_abilities_color_toggle = _ability_number
				selection.array_abilities_colors[_ability_number] = true
				zone_h = 3
				zone_w = 3
				zone_ch = 2
				zone_cw = 2
				var placement = instance_create_layer(mouse_x,mouse_y,"Instances",o_placement)
				placement.start_x = mouse_x
				placement.start_y = mouse_y		//This is so the zone thing doesn't appear at 0,0 for a frame
				dontclick = true
				goonzone = true
				playerstates = playerstates.placement
			break;
		}
	break;
}