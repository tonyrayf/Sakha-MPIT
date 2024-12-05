x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);


image_xscale = camera_get_view_width  (view_camera[0]);
image_yscale = camera_get_view_height (view_camera[0]);

image_alpha = 1;


iterator = 1;
fade_time = 1; //Время (в секундах)
delta_i = 1 / (fade_time * game_get_speed(gamespeed_fps));

easing_func = ease_inout_sine;


sprite_set_color(c_black);


to_room = room_next(room);

destroy = false;