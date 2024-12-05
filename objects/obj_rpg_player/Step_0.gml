#region Ввод

var _key_up		= (keyboard_check(vk_up)	or keyboard_check(ord("W"))) * can_move;
var _key_down	= (keyboard_check(vk_down)	or keyboard_check(ord("S"))) * can_move;
var _key_left	= (keyboard_check(vk_left)	or keyboard_check(ord("A"))) * can_move;
var _key_right	= (keyboard_check(vk_right) or keyboard_check(ord("D"))) * can_move;
var _key_run	= (keyboard_check(ord("X")) or keyboard_check(ord("K"))) * can_move;

#endregion

#region Передвижение и коллизия

if (!_key_run)
{
	move_speed = def_move_speed;
}
else
{
	move_speed = def_move_speed;
}

h_speed = (_key_right - _key_left) * move_speed;
v_speed = (_key_down - _key_up) * move_speed;

if (abs(h_speed) == abs(v_speed))
{
	h_speed = SQRT_2__2 * move_speed * sign(h_speed);
	v_speed = SQRT_2__2 * move_speed * sign(v_speed);
}

if (h_speed != 0) h_dir = sign(h_speed);
if (v_speed != 0) v_dir = sign(v_speed);

if (place_meeting(x + h_speed, y, obj_solidblock))
{
	while (!place_meeting(x + sign(h_speed), y, obj_solidblock)) x += sign(h_speed);
	h_speed = 0;
}

x += h_speed;

if (place_meeting(x, y + v_speed, obj_solidblock))
{
	while (!place_meeting(x, y + sign(v_speed), obj_solidblock)) y += sign(v_speed);
	v_speed = 0;
}

y += v_speed;

#endregion