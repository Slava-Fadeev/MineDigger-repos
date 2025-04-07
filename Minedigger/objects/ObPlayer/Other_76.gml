if (event_data[? "event_type"] == "sprite event"){
	if (event_data[? "message"] == "Step"){
		audio_play_sound(snd_steps, 13, false, random_range(0.01, 0.03), 0, random_range(0.7, 1.3));
	}
}