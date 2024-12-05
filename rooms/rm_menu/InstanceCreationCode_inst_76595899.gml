button_text = "Назад";

instance_deactivate_layer(layer);

mouse_func = function()
{
	instance_activate_layer("Menu");
	instance_deactivate_layer(layer);
}