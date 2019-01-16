civtimer++

if civtimer <= civrandom {
	civtimer = 0
	civrandom = 0 
	var _random = irandom_range(0,ds_list_size(o_controller.list_buildings)-1)
	var _house = ds_list_find_value(o_controller.list_buildings,_random)
	goalX = _house.x+66
	goalY = _house.y+145
	if scr_mp_grid_define_path(x,y,goalX,goalY,civilian_path,grid,true) {
		pos = 1
		x_goto = path_get_point_x(civilian_path,pos)
		y_goto = path_get_point_y(civilian_path,pos)
		civstates = civstates.move
	}
}