button_text = "Начать";

mouse_func = function()
{
	inst_button_fadeout.active = true;
	instance_activate_object(obj_fade_inout);
	
	mouse_func = function() {}
	
	inst_settings.mouse_func = mouse_func;
	inst_exit.mouse_func = mouse_func;
}