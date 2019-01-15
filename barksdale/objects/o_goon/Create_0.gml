name = "Goon"
portrait = s_portrait_goon
selected = false 

goalX = 0
goalY = 0
pos = 0
x_goto = 0
y_goto = 0

goon_path = path_add()

enum goonstates {
	idle,
	move,
}	

goonstates = goonstates.idle