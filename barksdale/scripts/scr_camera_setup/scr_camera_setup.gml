view_enabled = true
view_set_visible(0,true)

view_set_wport(0,1280)
view_set_hport(0,720)

window_set_rectangle((display_get_width()-view_wport[0])*0.5, (display_get_height()-view_hport[0])*0.5,view_wport[0],view_hport[0])
surface_resize(application_surface,view_wport[0],view_hport[0])

camera = camera_create_view(0,0,1280,720,0,id,200,200,1280,720)

view_set_camera(0,camera)

zoom_level = 1
default_zoom_width = camera_get_view_width(view_camera[0])
default_zoom_height = camera_get_view_height(view_camera[0])