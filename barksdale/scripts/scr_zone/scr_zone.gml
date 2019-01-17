var _object_index = argument[0]
var _ability_number = argument[1]

switch(object_get_name(_object_index))
{
	case "o_goon":
		switch(_ability_number)
		{
			case 0:
				zone_h = 3
				zone_w = 3
				zone_c1 = 2
				zone_c2 = 2
				zone_object_index = _object_index
				zone_ability_id = _ability_number
				playerstates = playerstates.placement
			break;
		}
	break;
}