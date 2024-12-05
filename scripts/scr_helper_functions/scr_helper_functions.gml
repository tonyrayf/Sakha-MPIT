function wrap(val, _min, _max)
{
	if (val > _max) return _min;
	else if (val < _min) return _max;
	else return val
}

function draw_rectangle_center(_x, _y, width, height, outline, color, alpha)
{
	var old_col = draw_get_color();
	var old_alp = draw_get_alpha();
	
	draw_set_color(color);
	draw_set_alpha(alpha);
	
	draw_rectangle(_x - width / 2, _y - height / 2, _x + width / 2, _y + height / 2, outline);
	
	draw_set_color(old_col);
	draw_set_alpha(old_alp);
}

global.backgrounds = ds_map_create();
global.backgrounds[? "hallway"]		= spr_hallway;
global.backgrounds[? "classroom"]	= spr_classroom;
global.backgrounds[? "musicroom"]	= spr_music_room;
global.backgrounds[? "bathroom"]	= spr_bathroom;

function background_set_index(arr)
{
	var bg_id = layer_background_get_id(layer_get_id("Background"));
	
	layer_background_sprite(bg_id, global.backgrounds[? arr[0]]);
}

function chatterbox_update()
{
	node = ChatterboxGetCurrent(chatterbox);
	text = ChatterboxGetContent(chatterbox, 0);
}