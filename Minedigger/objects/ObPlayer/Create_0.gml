depth = -10;
x -= 6;
y -= 6;
var _cam = view_camera[0];
var _w = camera_get_view_width(_cam) / 2;
var _h = camera_get_view_height(_cam) / 2;

camera_set_view_pos(_cam, x - _w + BS - 12, y - _h + 8);

Money = 0;
Depth = 0;
Health = 3;

particles = function(_x, _y, _count, _particles_colors){
	repeat(_count){
		var _part = instance_create_depth(_x, _y, - 13, ObParticle);
		_part.image_blend = _particles_colors[irandom(array_length(_particles_colors) - 1)];
	}
}