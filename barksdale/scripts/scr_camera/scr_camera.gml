//X and Y Movement
xsp = 25*(camera_right-camera_left)			//Defined in scr_keybinds and action is in scr_getinputs
ysp = 25*(camera_down-camera_up)

x += xsp
y += ysp

//Zooming Up and Down
zoom_level = clamp((zoom_level + (mouse_wheel_down()-mouse_wheel_up())*0.1),0.1,1.5)

camera_set_view_pos(camera,
        clamp( camera_get_view_x(camera), 0, room_width - camera_get_view_width(camera) ),
        clamp( camera_get_view_y(camera), 0, room_height - camera_get_view_height(camera) ));

var view_w = camera_get_view_width(view_camera[0])
var view_h = camera_get_view_height(view_camera[0])

var rate = 0.2

var new_w = lerp(view_w, zoom_level *  default_zoom_width, rate)
var new_h = lerp(view_h, zoom_level * default_zoom_height, rate)

camera_set_view_size(view_camera[0], new_w, new_h)

//ReAlignment
var shift_x = camera_get_view_x(view_camera[0]) - (new_w - view_w) * 0.5
var shift_y = camera_get_view_y(view_camera[0]) - (new_h - view_h) * 0.5

camera_set_view_pos(view_camera[0],shift_x, shift_y)

//X and Y Coordinates
{
	var edgeX = camera_get_view_width(camera)/2
	var edgeY = camera_get_view_height(camera)/2
	x = clamp(x,0+edgeX,room_width-edgeX)
	y = clamp(y,0+edgeY,room_height-edgeY)
}