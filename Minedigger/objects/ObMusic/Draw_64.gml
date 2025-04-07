if (!instance_exists(ObController)){
	exit;
}
draw_set_font(global.Font);

draw_text(10, 40, audio_is_playing(mus_cave));
draw_text(10, 60, audio_sound_get_gain(mus_cave));