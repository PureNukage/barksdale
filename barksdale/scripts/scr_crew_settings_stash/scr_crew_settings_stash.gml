for(var i=0;i<ds_list_size(list_buildings);i++) {
	var _id = ds_list_find_value(list_buildings,i)	
	
	if _id.ownership == ownership.player {
		ds_list_add(list_crew_settings_stash,_id)
	}	
	
}