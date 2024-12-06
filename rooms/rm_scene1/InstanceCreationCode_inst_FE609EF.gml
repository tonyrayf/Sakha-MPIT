array_mouse_func[0] = function()
{
	layer_background_speed(layer_background_get_id("Background"), 0);
	smooth_bg_change(spr_bg_scene1);
	
	mouse_func = array_mouse_func[1];
}
array_mouse_func[1] = function()
{
	if (!layer_exists("0"))
	{
		alarm_set(0, 1 * 60);
		alarm0_func = function()
		{
			instance_create_depth(0, 0, 0, obj_dialogue_control,
			{
				yarn_file : "scene1.yarn"
			});
			
			with (instance_create_depth(-300, 0, 0, obj_funcblock))
			{
				image_alpha = 0;
				
				step_func = function()
				{
					if (!instance_exists(obj_dialogue_control))
					{
						sprite_set_color(c_black);
						
						if (x != 0)
						{
							x = 0;
							image_xscale = 1920;
							image_yscale = 1080; 
						}
						
						image_alpha += 0.05;
					
						if (image_alpha >= 1) room_goto(rm_backstory);
					}
				}
			}
			
			instance_destroy();
		}
	}
	
	smooth_bg_change(spr_bg_scene1, 1);
}

mouse_func = array_mouse_func[0];

image_alpha = 0;