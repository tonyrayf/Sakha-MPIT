function get_current_character_data(name, img_ind = undefined)
{
	static character = ds_map_create();
	character[? "mainChara"] = {
		spr : spr_characters,
		ind : 0,
	}
	character[? "test1"] = {
		spr : spr_characters,
		ind : 1,
	}
	
	character[? name[0]].ind ??= img_ind;
	
	obj_control.current_character = character[? name[0]];
}


function background_set_index(arr)
{
	static backgrounds = ds_map_create();
	backgrounds[? "hallway"]	= spr_hallway;
	backgrounds[? "classroom"]	= spr_classroom;
	backgrounds[? "musicroom"]	= spr_music_room;
	backgrounds[? "bathroom"]	= spr_bathroom;
	
	
	var bg_id = layer_background_get_id(layer_get_id("Background"));
	
	layer_background_sprite(bg_id, backgrounds[? arr[0]]);
}


function chatterbox_update()
{
	node = ChatterboxGetCurrent(chatterbox);
	text = ChatterboxGetContent(chatterbox, 0);
}


function chatterbox_jump_func()
{
	with (obj_control)
	{
		chatterbox_update();
		is_mono = false;
	}
}