y = camera_get_view_y(view_camera[0]) + sprite_height / 2;

var _to_x = camera_get_view_x(view_camera[0]) / 2 + sprite_width / 3;

x = lerp(x, 1500, 0.02);

if (x > _to_x - 20 && x < _to_x + 40){
}

if (x > 1500){
	instance_destroy();
}