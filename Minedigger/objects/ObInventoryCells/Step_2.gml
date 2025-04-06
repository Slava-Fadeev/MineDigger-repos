var _cam = view_camera[0];
var _w = camera_get_view_width(_cam) / 2;
var _h = camera_get_view_height(_cam) / 2;
var _x = camera_get_view_x(_cam);
var _y = camera_get_view_y(_cam);


x = _x + (sprite_width) + 10;
y = _y + _w + YDelay;

if (InMouse){
	YDelay = lerp(YDelay, 5, 0.5);
}else{
	YDelay = lerp(YDelay, 10, 0.35);
}