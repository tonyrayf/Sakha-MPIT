if (keyboard_check_pressed(keyboard_key)) switch (keyboard_key)
{
	case vk_f4: {
		window_set_fullscreen(!window_get_fullscreen());
		break;
	}
}