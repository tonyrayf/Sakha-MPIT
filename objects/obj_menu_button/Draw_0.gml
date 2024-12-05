draw_self();

draw_set_font(f_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var c = c_white;
var scale = 1;
draw_text_transformed_color(x, y, button_text, scale, scale, 0, c, c, c, c, image_alpha);