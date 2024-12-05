/// @param {Constant.Color}  color  Цвет спрайта
/// @description					Устанавливает объекту, вызвавшего функцию, в качестве спрайта сплошной цвет (1x1) 

function sprite_set_color(color)
{
	sprite_index = spr_PIXEL;
	
	image_blend = color;
}