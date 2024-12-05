ChatterboxLoadFromFile("test.yarn");

ChatterboxAddFunction("bg",			background_set_index);
ChatterboxAddFunction("curr_chara", get_current_character_data);
ChatterboxAddFunction("is_mono",	function() { obj_control.is_mono = true; });

is_mono = false;		 // Is monologue

main_character = {
	spr : spr_characters,
	ind : 0,
}
current_character = {	 // Данные персонажа с которым ведётся диалог
	spr : 0,
	ind : 0,
}


chatterbox = ChatterboxCreate();

ChatterboxJump(chatterbox, "Start");	// Начало нарратива
chatterbox_update();					// Gets "node" and "text" variables

ChatterboxNodeChangeCallback(chatterbox_jump_func);


option_index = 0;

size = [0.7, 0.75];
color = [c_ltgray, c_white];