#macro cell_width 32
#macro cell_height 32

#macro level_width (room_width div cell_width)
#macro level_height (room_height div cell_height)

#region mp_grid

mp_grid_ = mp_grid_create(0,0,level_width,level_height,cell_width,cell_height)
#macro mp_grid o_controller.mp_grid_

ai_path = path_add()

mp_grid_add_instances(mp_grid,o_building,false)

#endregion

#region Grid

_grid = ds_grid_create(level_width,level_height)
#macro grid o_controller._grid
ds_grid_set_region(grid,0,0,level_width,level_height,0)

#macro otheR -4
#macro road -5
#macro sidewalk -6
#macro building -7
#macro bridge -8
#macro fence -9

/* ----------------------------------------------------------------------------------------------
			                          __                        __  .__               
		  ____  ____   ____   _______/  |________ __ __   _____/  |_|__| ____   ____  
		_/ ___\/  _ \ /    \ /  ___/\   __\_  __ \  |  \_/ ___\   __\  |/  _ \ /    \ 
		\  \__(  <_> )   |  \\___ \  |  |  |  | \/  |  /\  \___|  | |  (  <_> )   |  \
		 \___  >____/|___|  /____  > |__|  |__|  |____/  \___  >__| |__|\____/|___|  /
		     \/           \/     \/                          \/                    \/ 	
   ---------------------------------------------------------------------------------------------- */																						

//Var Init
var _x, _y, tileID1, tileID, tilename, tileindex, _sidewalktiles, _totaltiles
_x = 0
_y = 0
_sidewalktiles = 0
_totaltiles = 0

//Loop through and add tiles to grid

#endregion

