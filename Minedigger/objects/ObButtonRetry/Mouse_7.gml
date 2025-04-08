instance_create_depth(x - 500, room_height / 2, -10000, ObTransition)
instance_activate_object(ObMusic)

audio_sound_gain(mus_cave, 0.5, 1500);
audio_sound_gain(mus_shop, 0.5, 1500);
audio_sound_gain(ObDeathScreen.bombed, 0, 500);