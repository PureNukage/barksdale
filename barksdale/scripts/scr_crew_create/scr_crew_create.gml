for(var i=array_length_1d(crew);i>0;i--) {	//	Shifting crew members up one in the array
	crew[i] = crew[i-1]
	crew_stash[i] = crew_stash[i-1]
	crew_zone_x[i] = crew_zone_x[i-1]
	crew_zone_y[i] = crew_zone_y[i-1]
	if ds_list_size(crew[i]) >= 1 {	//	The crew we shifted has members! 
		for(var b=0;b<ds_list_size(crew[i]);b++) {	//	Loop through members and set their .crew to i
			var _id = ds_list_find_value(crew[i],b)	
			_id.crew = i
		}
	}
}

crew[0] = ds_list_create()		//	Making our new blank crew list
crew_stash[0] = 0
crew_zone_x[0] = ds_list_create()
crew_zone_y[0] = ds_list_create()