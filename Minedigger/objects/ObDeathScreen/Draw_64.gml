draw_set_font(global.FontDeath);

var _cam = view_camera[0];
var _w = camera_get_view_width(_cam) / 2;
var _h = camera_get_view_height(_cam) / 2;

draw_set_halign(fa_right);
draw_text(_w - 24, _h, $"{Depth}D/{CurrentDepth}D");

//draw_text(_w - 24, _h + 24, $"best:\n{CurrentDepth}D");

draw_set_halign(fa_left);
draw_text(_w + 32, _h, $"{Money}M/{CurrentMoney}M");

//draw_text(_w + 32, _h + 24, $"best:\n{CurrentMoney}M");