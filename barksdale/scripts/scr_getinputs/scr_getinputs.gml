camera_up = keyboard_check(ord("W"))
camera_left = keyboard_check(ord("A"))
camera_down = keyboard_check(ord("S"))
camera_right = keyboard_check(ord("D"))

arrowright = keyboard_check_pressed(vk_right)
arrowleft = keyboard_check_pressed(vk_left)
arrowup_down = keyboard_check(vk_up)
arrowdown_down = keyboard_check(vk_down)

leftpress = mouse_check_button(mb_left)
leftclick = mouse_check_button_pressed(mb_left)
rightpress = mouse_check_button(mb_right)
rightclick = mouse_check_button_pressed(mb_right)

debugtoggle = keyboard_check_pressed(vk_control)

