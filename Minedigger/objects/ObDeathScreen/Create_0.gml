Depth = ObPlayer.Depth;
Money = ObPlayer.Money;
audio_play_sound(mus_bombed, 12, true, 0);

audio_sound_gain(mus_bombed, 0.5, 1500);
audio_sound_gain(mus_cave, 0, 1500);
audio_sound_gain(mus_shop, 0, 1500);

var _cam = view_camera[0];
var _x = camera_get_view_x(_cam);
var _y = camera_get_view_y(_cam);

x = _x;
y = _y;
depth = -1000;
image_alpha = 0;
alarm[0] = 30;

ini_open("save.ini");

CurrentDepth = ini_read_real("Record", "Depth", abs(Depth));
CurrentMoney = ini_read_real("Record", "Money", Money);

if (abs(Depth) >= CurrentDepth){
	ini_write_real("Record", "Depth", abs(Depth));
}
if (Money >= CurrentMoney){
	ini_write_real("Record", "Money", Money);
}



ini_close();