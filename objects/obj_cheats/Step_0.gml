if (!Debug) exit;

if (keyboard_check_pressed(keyboard_key)) switch (keyboard_key)
{
	case vk_numpad1: {
		room_goto(wrap(int64(room) - 1, int64(room_first), int64(room_last)));
		break;
	}
	case vk_numpad2: {
		room_goto(wrap(int64(room) + 1, int64(room_first), int64(room_last)));
		break;
	}
}