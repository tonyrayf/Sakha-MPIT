active = false;

iterator = 0;

var fade_time = 1.5; //Время (в секундах)
delta_i = 1 / (fade_time * game_get_speed(gamespeed_fps));

step_func = function()
{
	if (!active) exit;
	
	iterator += delta_i;
	var i = 0;
	repeat (instance_number(obj_menu_button))
	{
		instance_find(obj_menu_button, i).image_alpha = lerp(1, 0, ease_inout_sine(iterator));
		i += 1;
	}
	
	if (iterator >= 1)
	{
		room_goto(rm_scene1);
	}
}