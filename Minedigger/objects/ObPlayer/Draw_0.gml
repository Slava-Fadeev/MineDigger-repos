draw_sprite_ext(SpLight, 0, x, y, image_xscale, 1, 0, c_white, sin(current_time / 800) - 0.75);

var _min = 1;
var _max = 2;

if (ScannerActive){
	_min = ScannerRadius - 1;
	_max = ScannerRadius;
	
	draw_sprite(SpScannerWork, current_time / 100, x, y);
}

if (DetectorActive){
	_min = 11;
	_max = 11;
}

for(var i = -_min; i < _max; i++){
	for(var j = -_min; j < _max; j++){
		var _tile = tilemap_get(global.BombsLayerTilemap, x div BS + i, y div BS + j);
		
		if (!ScannerActive){
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
			
				draw_sprite(SpNumbers, _number, (x + i * BS) div BS * BS + BS / 2, (y + j * BS) div BS * BS + BS / 2);
			
				draw_set_alpha(1);
			}
		}else{
			if (tilemap_get(global.BombsLayerTilemap, x div BS + i, y div BS + j)){
				draw_sprite(SpScannerMine, 0, (x div BS + i) * BS + BS / 2, (y div BS + j) * BS + BS / 2);
			}
		}
	}
}
draw_self();

var _dir = point_direction(x, y, mouse_x, mouse_y);
var _x = lengthdir_x(BS, _dir);
var _y = lengthdir_y(BS, _dir);


draw_set_alpha(0.55);
draw_sprite(SpSelect, 0, BS / 2 + (x + _x) div BS * BS, BS / 2 + (y + _y) div BS * BS);
draw_set_alpha(1);

var _tile = tilemap_get_at_pixel(global.BlocksLayerTilemap, x + _x, y + _y);
if (_tile >= Ore.ShopHeart && _tile <= Ore.ShopMineDetect){
	draw_sprite(SpDescriptions, _tile - 70, BS / 2 + (x + _x) div BS * BS, BS / 2 + (y + _y) div BS * BS);
	
	draw_set_font(global.FontShop);
	draw_set_halign(fa_center);
	draw_text(BS / 2 + (x + _x) div BS * BS + 4, BS / 2 + (y + _y) div BS * BS - 8, string(Prices[_tile - 71]) + "M");
	draw_set_halign(fa_left);
}