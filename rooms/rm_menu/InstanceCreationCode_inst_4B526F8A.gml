button_text = "Звук: Да!";

sound = true;

mouse_func = function()
{
	sound = !sound;
	
	if (!sound) button_text = "Звук: Нет";
	else button_text = "Звук: Да!";
}