/// @param {real}	val	 Значение для wrap'а
/// @param {real}  _max  Максимальное значение
/// @param {real}  _min  Минимальное значение
/// @description		 Делает ограничение как clamp, но при превышении или наоборот начинает заново как диск кодового замка	  

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