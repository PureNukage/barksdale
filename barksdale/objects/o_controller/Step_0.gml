scr_getinputs()

scr_camera()

switch(initial_resource_count)
{
	case initial_resource_count.building_load:
		initial_resource_count = initial_resource_count.count_resources
	break;
	case initial_resource_count.count_resources:
		scr_resource_count()
		initial_resource_count = initial_resource_count.stop_counting
	break;
	case initial_resource_count.stop_counting:
		
	break;
}

switch(playerstates)
{
	case playerstates.free: scr_player_free() break;
	case playerstates.placement: scr_player_placement() break;	
}

scr_debug_controls()

//Day restart
if current_minute != day_current {	// It's a new day!
	day_previous = day_current
	day_current = current_minute
	if instance_exists(o_civilian) {
		with o_civilian {
			recently_purchased = false
		}
	}
}