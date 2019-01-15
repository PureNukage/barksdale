var _random = 0

_random[0] = irandom_range(1,255)
_random[1] = irandom_range(1,255)
_random[2] = irandom_range(1,255)

var color = make_color_rgb(_random[0],_random[1],_random[2])

return color