var key_up = keyboard_check_pressed(vk_up);
var key_down = keyboard_check_pressed(vk_down);
var key_accept = keyboard_check_pressed(vk_space);

var count = ChatterboxGetOptionCount(chatterbox);

if (ChatterboxIsWaiting(chatterbox) and key_accept)
{
	ChatterboxContinue(chatterbox);
	chatterbox_update();
}
else if (count)
{
	var move = key_down - key_up;
	
	var option = wrap(option_index + move, 0, count - 1);
	repeat (1 + (ChatterboxGetOptionConditionBool(chatterbox, option) == false))
	{
		option_index = option;
	}
	
	if (key_accept)
	{
		ChatterboxSelect(chatterbox, option_index);
		option_index = 0;
		
		chatterbox_update();
	}
}

if (ChatterboxIsStopped(chatterbox))
{
	instance_destroy();
}