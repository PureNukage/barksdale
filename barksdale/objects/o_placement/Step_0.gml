//from the mouse x and y position, save the coordinates for a rectangle from zone_w and zone_h

x = mouse_x-16
y = mouse_y-16

if !place_snapped(32,32) {
	move_snap(32,32)
}

_x = x
_y = y

start_x = x - (((o_controller.zone_cw-1)*32))
start_y = y - (((o_controller.zone_ch-1)*32))
