///@function scr_civilian_spawn()
///@description Spawns a random amount of civilians

var _totalhouses = instance_number(o_house)

var _totalcivs = _totalhouses - 6

for(var i=0;i<_totalcivs;i++) {
	var _random = irandom_range(0,ds_list_size(o_controller.list_buildings)-1)
	var _randomhouse = ds_list_find_value(o_controller.list_buildings,_random)
	instance_create_layer(_randomhouse.x+33,_randomhouse.y+72,"Instances",o_civilian)	
}