for(var i=array_length_1d(crew);i>0;i--) {	//	Shifting crew members up one in the array
	crew[i] = crew[i-1]
}

crew[0] = ds_list_create()		//	Making our new blank crew list