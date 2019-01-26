if (leftclick) {
	if scr_leftclick_debug() {
		exit;	
	} else if scr_leftclick_crews() {
		exit;
	} else if scr_leftclick_ability() {
		exit;
	}
	scr_leftclick_selection()
}

if (rightclick) {
	scr_rightclick()
}