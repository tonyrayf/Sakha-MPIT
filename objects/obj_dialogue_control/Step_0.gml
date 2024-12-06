#region Input

var key_up		= keyboard_check_pressed(vk_up)		or keyboard_check_pressed(ord("W"));
var key_down	= keyboard_check_pressed(vk_down)	or keyboard_check_pressed(ord("S"));
var key_accept	= keyboard_check_pressed(vk_space)	or keyboard_check_pressed(vk_enter)	 or keyboard_check_pressed(ord("Z"));

#endregion


#region Interact

var count = ChatterboxGetOptionCount(chatterbox);

if (key_accept and ChatterboxIsWaiting(chatterbox))
{
	ChatterboxContinue(chatterbox);
	chatterbox_update();
}
else if (count)
{
	var move = key_down - key_up;
	
	var option = wrap(option_index + move, 0, count - 1);
	option_index = option;
	
	if (key_accept)
	{
		ChatterboxSelect(chatterbox, option_index);
		option_index = 0;
		
		chatterbox_update();
	}
}

#endregion

var fade_spd = 0.1;

if (image_alpha < 1) image_alpha += fade_spd;


if (ChatterboxIsStopped(chatterbox))
{
	instance_destroy();
}