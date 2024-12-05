var text_scale = 1;


draw_set_font(f_main);
draw_set_valign(fa_middle);

var margin_text = 128;
var margin_char = 200;

if (IsChatterbox(chatterbox) and text != undefined)
{
	var me = (ChatterboxGetContentSpeaker(chatterbox, 0) == "Молодчик");
	
	draw_sprite_ext(spr_characters, 0, margin_char,					room_height, size[me]  * 1.5, size[me]  * 1.5, 0, color[me],  1);
	draw_sprite_ext(spr_characters, 1, room_width - margin_char,	room_height, size[!me] * 1.5, size[!me] * 1.5, 0, color[!me], 1);
	
	var yy = room_height - (margin_text / 2);
	
	draw_rectangle_center(room_width / 2, yy, room_width, margin_text, false, c_black, 0.5);
	
	draw_set_halign(me ? fa_left : fa_right);
	var xx = me ? margin_text : room_width - margin_text;
	draw_text_transformed(xx, yy, text, text_scale, text_scale, 0);
	
	if (ChatterboxGetOptionCount(chatterbox))
	{
		draw_set_halign(fa_center);
		
		var width = 400;
		var height = 64;
		
		
		var i = 0;
		repeat (ChatterboxGetOptionCount(chatterbox))
		{
			if (ChatterboxGetOptionConditionBool(chatterbox, i))
			{
				xx = room_width / 2;
				yy = (room_height / 6) * (i + 2);
			}
			
			draw_rectangle_center(xx, yy, width, height, false, c_black, 0.5);
			
			var icon = "";
			if (option_index == i) icon = "> ";
			var option = ChatterboxGetOption(chatterbox, i);
			
			draw_text_transformed(xx, yy, icon + option, text_scale, text_scale, 0);
			
			i += 1;
		}
	}
}