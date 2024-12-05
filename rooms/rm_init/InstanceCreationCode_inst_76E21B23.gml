alarm0_func = function()
{
	room_goto(rm_menu);
}

alarm_set(0, 1.5 * game_get_speed(gamespeed_fps));