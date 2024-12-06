function smooth_bg_change(new_bg, ind = 0, time = 0.5)
{	
	static backgrounds = ds_map_create();
		backgrounds[? "hallway"		] = spr_hallway;
		backgrounds[? "classroom"	] = spr_classroom;
		backgrounds[? "musicroom"	] = spr_music_room;
		backgrounds[? "bathroom"	] = spr_bathroom;
	
	
	if (time <= 0) show_error("Transition time should be >= 0", true);
	
	if (layer_exists("0")) exit;
	
	
	if (typeof(new_bg) == "array")
	{
		new_bg	= new_bg[0];
		ind		= ind[0];
		time	= time[0];
	}
	
		
	//Set variables
	var bg_lay_id	= layer_background_get_id("Background");
	var old_bg_spr	= layer_background_get_sprite(bg_lay_id);
		
	var temp_lay = layer_create(layer_get_depth("Background") - 1, "0");
		temp_lay = layer_background_create(temp_lay, old_bg_spr);
	layer_background_stretch(temp_lay, true);
	
	
	layer_background_sprite	(bg_lay_id, typeof(new_bg) == "array" ? backgrounds[? new_bg] : new_bg);
	layer_background_index	(bg_lay_id, ind);
	
	
	with (instance_create_depth(0, 0, 0, obj_funcblock,
	{
		spd			: 1 / (time * game_get_speed(gamespeed_fps)),
		temp_lay_id : temp_lay,
		image_alpha : 0
	}))
	{
		i = 1;
		
		step_func = function()
		{
			i -= spd;
			layer_background_alpha(temp_lay_id, ease_inout_sine(i));
	
			if (i <= 0)
			{
				layer_destroy("0");
				instance_destroy();
			}
		}
	}
	
	return false;
}