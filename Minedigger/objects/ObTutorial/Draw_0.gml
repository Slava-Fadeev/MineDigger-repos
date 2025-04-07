if (End){
	if (!Back){
		image_xscale += 0.0225;
		image_yscale += 0.0225;
	}
	image_alpha -= 0.05;
	shader_set(ShColorize);
	
	shader_set_uniform_f(red, 1 + image_xscale);
	shader_set_uniform_f(green, 1 + image_xscale);
	shader_set_uniform_f(blue, 1 + image_xscale);
	
	draw_self();
	
	shader_reset();
	
	if (image_xscale > 1.2 || Back){
		image_xscale -= 0.1;
		image_yscale -= 0.1;
		Back = true;
		audio_play_sound(snd_tutorial_close, 13, false, random_range(0.05, 0.1), 0.15, random_range(0.8, 1.2));
	}
	
	if (image_xscale <= 0){
		instance_destroy();
	}
	
}else{
	draw_self();
}