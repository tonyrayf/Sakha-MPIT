ChatterboxLoadFromFile("test.yarn");

ChatterboxAddFunction("bg", smooth_bg_change);

ChatterboxAddFunction("main_chara_sprite",	get_main_character_sprite);
ChatterboxAddFunction("main_chara_index",	get_main_character_index);

ChatterboxAddFunction("curr_chara_sprite",	get_curr_character_sprite);
ChatterboxAddFunction("curr_chara_index",	get_curr_character_index);

ChatterboxAddFunction("is_mono", function() { obj_dialogue_control.is_mono = true; });

is_mono = false;		 // Is monologue

main_character = {
	sprite	: spr_djuluur,
	index	: 0,
}
current_character = {	 // Данные персонажа с которым ведётся диалог
	sprite	: spr_mama,
	index	: 0,
}


chatterbox = ChatterboxCreate();

ChatterboxJump(chatterbox, "Start");	// Начало нарратива
chatterbox_update();					// Gets "node" and "text" variables

ChatterboxNodeChangeCallback(chatterbox_jump_func);


option_index = 0;

size = [0.96, 1];
color = [c_ltgray, c_white];


image_alpha = 0;