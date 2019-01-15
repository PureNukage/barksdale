name = "Civilian"
portrait = s_portrait_blank
selected = false

civtimer = 0
goalX = 0
goalY = 0

enum civstates {
	idle,
	move,
}

civrandom = irandom(30)
civstates = civstates.idle

color = scr_random_color()