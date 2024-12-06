var key_right	 = keyboard_check(vk_right)	or keyboard_check(ord("D"));
var key_left	 = keyboard_check(vk_left)	or keyboard_check(ord("A"));
var key_jump	 = keyboard_check_pressed(vk_up)  or keyboard_check_pressed(ord("W"));
var key_jump_rel = keyboard_check_released(vk_up) or keyboard_check_released(ord("W"));

#region Движение по X


//Направление движения
if (can_move) direction_x = key_right - key_left;


//Плавное движение
if (direction_x != 0)
{
	speed_x += acceleration_x * direction_x;
	last_direction_x = direction_x;
}
else if (can_decelerate)
{
	if (sign(speed_x) == last_direction_x) speed_x += -deceleration_x * last_direction_x;
	
	//Если скорость ушла в обратную сторону, то обнуляем скорость 
	else speed_x = 0;
}

speed_x = clamp(speed_x, top_speed_x_left, top_speed_x_right);

var step_over = false; //Перешагивание мелких уступов
if (place_meeting(x + speed_x, y, obj_solidblock)) //Коллизия по X
{
	var i = 1; var step_over_maximum = 10;
	repeat (step_over_maximum)
	{
		//Проверяем от 1 до step_over_max количества пикселей можно ли перешагнуть уступ
		if (!place_meeting(x + speed_x, y - i, obj_solidblock))
		{
			y -= i;
			step_over = true;
			break;
		} i += 1;
	}
	if (!step_over)
	{
		while (!place_meeting(x + sign(speed_x), y, obj_solidblock))
		{
			x += sign(speed_x);
		}
		speed_x = 0;
	}
}

x += speed_x;

#endregion
#region Движение по Y


speed_y += acceleration_g; //Гравитация


if (can_jump and !place_meeting(x, y - 1, obj_solidblock)) //Прыжок
{
	//Возможность прыгать 1
	if (place_meeting(x, y + 1, obj_solidblock))
		alarm_set(0, 0.1 * game_get_speed(gamespeed_fps)); //ОБЪЯСНЕНИЕ В САМОМ АЛАРМЕ
	
	//Возможность прыгать 2	
	if (key_jump)
		alarm_set(1, 0.1 * game_get_speed(gamespeed_fps)); //ОБЪЯСНЕНИЕ В САМОМ АЛАРМЕ
	
	
	//Активация прыжка
	if (key_jump and alarm_get(0) >= 0)
	or (place_meeting(x, y + 1, obj_solidblock) and alarm_get(1) >= 0)
	{
		speed_y = -jump_start_speed;
		alarm_set(0, 0);
		alarm_set(1, 0);
	}
	
	if (key_jump_rel and speed_y < 0) //Velocity Cut
	{
		speed_y *= 0.5;
		//Если отпустить кнопку прыжка, скорость делится наполовину
	}
}


if (place_meeting(x, y + speed_y, obj_solidblock)) //Коллизия по Y
{
	while (!place_meeting(x, y + sign(speed_y), obj_solidblock))
	{
		y += sign(speed_y);
	}
	speed_y = 0;
}


y += speed_y;


#endregion

show_debug_message(x)
show_debug_message(y)