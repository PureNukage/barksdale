//	Jumping to the mouse...
x = mouse_x-16
y = mouse_y-16

//	...and snapping to the 32x32 grid
if !place_snapped(cell_width,cell_height) {
	move_snap(cell_width,cell_height)
}

//Getting the topleft pixel of the zone
start_x = x - ((o_controller.zone_cw-1)*32)		
start_y = y - ((o_controller.zone_ch-1)*32)
