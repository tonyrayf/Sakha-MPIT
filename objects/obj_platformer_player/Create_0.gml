/*
//Тело
my_body = {
	head	: obj_*_head,
	torso	: obj_*_torso,
	leg_r	: obj_*_leg_l,
	leg_l	: obj_*_leg_r
}
*/

my_sprites = {
	stand : spr_characters,
}


//X скорость
speed_x = 0;
direction_x = 0;
last_direction_x = 0;						// -1 - влево, 1 - вправо
top_speed_x_def = 10;						// def-олтная скорость игрока
top_speed_x_left = -top_speed_x_def;		// Максимальная скорость движения влево
top_speed_x_right = top_speed_x_def;		// Максимальная скорость движения вправо
acceleration_x = 1;							// Ускорение в начале движения
deceleration_x = 1.5;						// Торможение

//Y скорость
speed_y = 0;
acceleration_g = 2; //Текущее ускорение падения

//Прыжок
//Для фиксированной высоты прыжка задаём нач. скорость по формуле v0 = sqrt(2*g*h)
var jump_height = 0.5*sprite_get_height(my_sprites.stand);
jump_start_speed = ceil(sqrt(2 * acceleration_g * jump_height) - 0.5);


//Дополнительные переменные
can_decelerate = true;
can_move = true; //Можно ли передвигаться персонажем
can_jump = true; //Можно ли прыгать