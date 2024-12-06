//Main Character Funcs
function get_main_character_sprite(sprite)
{
	static characters_spr = ds_map_create();
		characters_spr[? "djuluur"] = spr_djuluur;
	
	obj_dialogue_control.main_character.sprite = characters_spr[? sprite[0]];
}
function get_main_character_index(index)
{
	obj_dialogue_control.main_character.index = index[0];
}


//Current Character Funcs
function get_curr_character_sprite(sprite)
{
	static characters_spr = ds_map_create();
		characters_spr[? "djuluur"] = spr_djuluur;
	
	obj_dialogue_control.current_character.sprite = characters_spr[? sprite[0]];
}
function get_curr_character_index(index)
{
	obj_dialogue_control.current_character.index = index[0]; 
}


function chatterbox_update()
{
	node = ChatterboxGetCurrent(chatterbox);
	text = ChatterboxGetContent(chatterbox, 0);
}


function chatterbox_jump_func()
{
	with (obj_dialogue_control)
	{
		chatterbox_update();
		is_mono = false;
	}
}


ChatterboxAddFunction("bg", smooth_bg_change);

ChatterboxAddFunction("main_chara_sprite",	get_main_character_sprite);
ChatterboxAddFunction("main_chara_index",	get_main_character_index);

ChatterboxAddFunction("curr_chara_sprite",	get_curr_character_sprite);
ChatterboxAddFunction("curr_chara_index",	get_curr_character_index);

ChatterboxAddFunction("text_scale", function(scale) { obj_dialogue_control.text_scale = scale[0]; });

ChatterboxAddFunction("hide_charas", function(hide) { obj_dialogue_control.hide_charas = hide[0]; })

ChatterboxAddFunction("is_mono", function() { obj_dialogue_control.is_mono = true; });