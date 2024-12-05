button_text = "Вид: В окне";

mouse_func = function()
{
	window_set_fullscreen(!window_get_fullscreen());
	
	if (window_get_fullscreen()) button_text = "Вид: Полный";
	else button_text = "Вид: В окне";
}