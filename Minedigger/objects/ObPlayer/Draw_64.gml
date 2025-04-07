for(var i = 0; i < 3; i++){
	draw_sprite(SpHeart, i >= Health, (camera_get_view_width(view_camera[0]) / 2) - 20 + 8 + 13 * i, 7);
}

if (HeartLoss){
	draw_sprite(SpHeartDestroy, HeartLossFrame, (192 / 2) - 20 + 8 + 13 * Health, 7);
	HeartLossFrame += 0.3;
	
	if (HeartLossFrame >= sprite_get_number(SpHeartDestroy) - 1){
		HeartLoss = false;
		HeartLossFrame = 0;
	}
}

draw_set_font(global.FontDepth);
draw_text(6, 6, string(Depth) + "M");

draw_set_font(global.FontMoney);
draw_set_halign(fa_right);

draw_text(camera_get_view_width(view_camera[0]) + 5, 6, string(Money) + "M");
draw_set_halign(fa_left);