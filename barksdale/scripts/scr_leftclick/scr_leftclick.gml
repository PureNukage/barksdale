///@function scr_leftclick()
///@description 
///@param 


/*
	This code is currently used with "o_controller". 
	
	The function is used to select objects on the screen with a leftclick.
																								*/
																								
//Gui layer click

if scr_leftclick_debug() {
	exit;
}

if scr_leftclick_crews() { 
	exit;
}

if (selection != 0 and scr_abilityclick()) { 
	exit;
}
																								
																								
scr_leftclick_selection()
