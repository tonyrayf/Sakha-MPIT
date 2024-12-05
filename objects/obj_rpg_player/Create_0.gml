h_speed = 0;
v_speed = 0;
h_dir = 1;
v_dir = 1;

can_move = true;
def_move_speed = 1;
move_speed = def_move_speed;

#macro SQRT_2__2 floor(sqrt(2) * 5) / 10

def_image_speed = image_speed;

my_sprites = {
	stand : spr_player_stand,
	right : spr_player_right,
	left  : spr_player_left,
	down  : spr_player_down,
	up	  : spr_player_up
}

spk_block = -1;

image_index = 1;