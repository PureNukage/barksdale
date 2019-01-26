#region Enumerators

//Initial Resource Count
enum initial_resource_count {
	building_load,										//	This is used to run scripts after all
	count_resources,									//	objects have loaded into the room
	stop_counting										//	(add objects to list, first resource count etc)
}

//Ownership
enum ownership {
	player,
	world,
}	

//Playerstates
enum playerstates {
	free,
	placement,
}

//Goon
enum goonjobs {
	hopper
}
enum goonstates {
	idle,
	move,
}	

enum goontasks {
	roam,
	deal,
}

//House
enum house {
	vacant,
	owned,
	safehouse,
	
}

//Ability Types
enum type {
	upgrade,
	ability,
	purchase
}

//Civ
enum civstates {
	idle,
	move,
}

#endregion

#region Macros

#macro gui_x device_mouse_x_to_gui(0)
#macro gui_y device_mouse_y_to_gui(0)

#endregion