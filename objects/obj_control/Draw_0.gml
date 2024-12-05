if (!IsChatterbox(chatterbox) or text == undefined) exit;


#region Properties

draw_set_font(f_main);
draw_set_valign(fa_middle);


var text_scale = 1;
var space_text = 128;
var space_char = 200;

var space_chara = 300; 

#endregion


#region Draw characters on screen

var is_MC = (ChatterboxGetContentSpeaker(chatterbox, 0) == "Молодчик");	 // is Main Character?


//Chara-s
draw_sprite_ext(main_character.spr,	main_character.ind, is_mono ? room_width / 2 : space_chara, room_height, size[is_MC] * 1.5, size[is_MC] * 1.5, 0, color[is_MC], 1);

if (!is_mono) draw_sprite_ext(current_character.spr, current_character.ind, room_width - space_chara, room_height, size[!is_MC] * 1.5, size[!is_MC] * 1.5, 0, color[!is_MC], 1);


var yy = room_height - (space_text / 2);  // Y текстбокса и текста

draw_rectangle_center(room_width / 2, yy, room_width, space_text, false, c_black, 0.5);  // Рисуем текстбокс


//X текстбокса и текста
draw_set_halign(is_MC ? fa_left : fa_right);
var xx = is_MC ? space_text : room_width - space_text;

//Риусем текста поверх текстбокса
draw_text_transformed(xx, yy, text, text_scale, text_scale, 0);

#endregion


if (ChatterboxGetOptionCount(chatterbox)) //Рисуем опции
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