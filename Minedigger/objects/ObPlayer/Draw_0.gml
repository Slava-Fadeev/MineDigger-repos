for(var i = -1; i < 2; i++){
	for(var j = -1; j < 2; j++){
		var _tile = tilemap_get(global.BombsLayerTilemap, x div BS + i, y div BS + j);
		
		var _number = 0;
		for(var _x = -1; _x < 2; _x++){
			for(var _y = -1; _y < 2; _y++){
				if (tilemap_get(global.BombsLayerTilemap, x div BS + i + _x, y div BS + j + _y)){
					_number ++;
				}
			}
		}
		
		if (_number){
			draw_set_alpha(0.75);
			if (i == 0 && j == 0){
				draw_set_alpha(0.25);
			}
			
			draw_sprite(SpNumbers, _number, x + i * BS, y + j * BS);
			
			draw_set_alpha(1);
		}
	}
}

draw_sprite_ext(SpLight, 0, x, y, image_xscale, 1, 0, c_white, 0.25);
draw_self();