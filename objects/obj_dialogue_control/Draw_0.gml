if (!IsChatterbox(chatterbox) or text == undefined) exit;


#region Properties

draw_set_font(f_main);
draw_set_valign(fa_middle);

draw_set_alpha(image_alpha);


var text_space_x = 200;
var text_space_y = 200;

var chara_space = 500;

#endregion


#region Draw characters on screen

var is_MC = (ChatterboxGetContentSpeaker(chatterbox, 0) == main_character.name); // is Main Character?

var is_narrator = (ChatterboxGetContentSpeaker(chatterbox, 0) == "");

//Chara-s

var scale = !is_narrator ? size[is_MC]	: size[0];
var col	  = !is_narrator ? color[is_MC]	: color[0];
if (!hide_charas) draw_sprite_ext(main_character.sprite, main_character.index, is_mono ? room_width / 2 : chara_space, room_height, scale, scale, 0, col, image_alpha);

scale = !is_narrator ? size[!is_MC]	 : size[0];
col	  = !is_narrator ? color[!is_MC] : color[0];
if (!is_mono and !hide_charas) draw_sprite_ext(current_character.sprite, current_character.index, room_width - chara_space, room_height, scale, scale, 0, col, image_alpha);


var yy = room_height - (text_space_y / 2);  // Y текстбокса и текста

draw_rectangle_center(room_width / 2, yy, room_width, text_space_y, false, c_black, 0.5 * image_alpha);  // Рисуем текстбокс


//X текстбокса и текста
draw_set_halign(fa_left);
var xx = text_space_x;

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
		
		draw_rectangle_center(xx, yy, width, height, false, c_black, 0.5 * image_alpha);
		
		var icon = "";
		if (option_index == i) icon = "> ";
		var option = ChatterboxGetOption(chatterbox, i);
		
		draw_text_transformed(xx, yy, icon + option, text_scale, text_scale, 0);
		
		i += 1;
	}
}