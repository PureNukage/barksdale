name = "Civilian"
portrait = s_portrait_blank
selected = false

civtimer = 0
goalX = 0
goalY = 0
x_goto = 0
y_goto = 0
pos = 0
movespeed = 3

civilian_path = path_add()

enum civstates {
	idle,
	move,
}

civrandom = irandom_range(1,30)
civstates = civstates.idle

color = scr_random_color()