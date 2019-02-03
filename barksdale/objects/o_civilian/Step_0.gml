switch(civstates)
{
	case civstates.idle: scr_civilian_idle() break;
	case civstates.move: scr_civilian_move() break;
}

depth = -y