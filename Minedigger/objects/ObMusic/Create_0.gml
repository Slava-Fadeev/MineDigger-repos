if room = RmMenu{
	global.mus = audio_play_sound(mus_menu,10,true)
}
if room = RmGame{
	global.musCave = audio_play_sound(mus_cave,10,true)
	global.musShop = audio_play_sound(mus_shop,9,true)
	audio_sound_gain(global.musCave,0,0)
	audio_sound_gain(global.mus,0,1500)
	audio_sound_gain(global.musShop,0,0)
	alarm[0] = 1
}