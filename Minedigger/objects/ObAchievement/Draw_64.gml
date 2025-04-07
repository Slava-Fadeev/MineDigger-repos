draw_set_font(global.Font);
shader_set(ShWaveColorize);

shader_set_uniform_f(time, current_time / 1000);
var _uv = sprite_get_uvs(SpDeathScreen, image_index);
shader_set_uniform_f(uv, _uv[0], _uv[2]);

if (!SizeBack){
	AchievementXSize = lerp(AchievementXSize, 1, 0.5);
	AchievementYSize = lerp(AchievementYSize, 1, 0.5);
}else{
	AchievementXSize = lerp(AchievementXSize, 0, 0.65);
	AchievementYSize = lerp(AchievementYSize, 0, 0.65);
	
	if (AchievementXSize <= 0.05){
		Achievement = "";
		SizeBack = false;
	}
}

switch(Achievement){
	case "Depth":
		draw_set_halign(fa_center);

		draw_text_transformed(192 / 2 + 6, 15, $"depth\n{ObPlayer.Depth}", AchievementXSize, AchievementYSize, 0);
		draw_set_halign(fa_left);
	break;
	case "Diamonds":
		draw_set_halign(fa_center);

		draw_text_transformed(192 / 2 + 6, 15, $"diamonds\n{Diamonds}", AchievementXSize, AchievementYSize, 0);
		draw_set_halign(fa_left);
	break;
	case "Emeralds":
		draw_set_halign(fa_center);

		draw_text_transformed(192 / 2 + 6, 15, $"emeralds\n{Emeralds}", AchievementXSize, AchievementYSize, 0);
		draw_set_halign(fa_left);
	break;
	case "Golds":
		draw_set_halign(fa_center);

		draw_text_transformed(192 / 2 + 6, 15, $"golds\n{Gold}", AchievementXSize, AchievementYSize, 0);
		draw_set_halign(fa_left);
	break;
}

shader_reset();