if (InMouse){
	DrawXS = lerp(DrawXS, 1, 0.33);
}else{
	DrawXS = lerp(DrawXS, 0, 0.23);
}

draw_sprite_ext(SpButtonSelect, 0, x + sprite_width / 2 + 2, y, DrawXS, 1, 0, c_white, DrawXS * 2);

draw_self();