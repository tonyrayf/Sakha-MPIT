is_mono = false;		 // Is monologue

main_character = {
	name	: "Дьулуур",
	sprite	: spr_djuluur,
	index	: 0,
}
current_character = {	 // Данные персонажа с которым ведётся диалог
	sprite	: spr_mama,
	index	: 0,
}

text_scale = 1;
hide_charas = false;

chatterbox = ChatterboxCreate(yarn_file);

ChatterboxJump(chatterbox, "Start");	// Начало нарратива
chatterbox_update();					// Gets "node" and "text" variables

ChatterboxNodeChangeCallback(chatterbox_jump_func);


option_index = 0;

size = [0.96, 1];
color = [c_ltgray, c_white];


image_alpha = 0;