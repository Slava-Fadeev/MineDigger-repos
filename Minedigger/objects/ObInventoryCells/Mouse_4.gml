// 14

var _cell = (mouse_x - bbox_left) div 14;
_cell = clamp(_cell, 0, 3);

if (Stacks[_cell] <= 0){
	exit;
}
var _do_minus = false;

switch(Items[_cell]){
	case 1:
		if (ObPlayer.Health < 3){
			_do_minus = true;
			ObPlayer.Health ++;
			
		}
	break;
	case 2:
		_do_minus = true;
		ObPlayer.ScannerActive = true;
		ObPlayer.ScannerRadius += (ObPlayer.ScannerActive ? 1 : 3);
		ObPlayer.alarm[0] += (ObPlayer.ScannerActive ? 300 : 600);
	break;
	case 3:
		_do_minus = true;
		ObPlayer.ScannerActive = true;
		ObPlayer.ScannerRadius += (ObPlayer.ScannerActive ? 2 : 5);
		ObPlayer.alarm[0] += (ObPlayer.ScannerActive ? 150 : 1200);
	break;
	case 4:
		_do_minus = true;
		ObPlayer.Health = 3;
	break;
	case 5:
		_do_minus = true;
		
		for(var i = -1; i < 2; i++){
			for(var j = -1; j < 2; j++){
				var _bomb = tilemap_get(global.BombsLayerTilemap, ObPlayer.x div BS + i, ObPlayer.y div BS + j);
				
				if (_bomb){
					tilemap_set(global.BombsLayerTilemap, 0, ObPlayer.x div BS + i, ObPlayer.y div BS + j);
				}
			}
		}
		
	break;
	case 6:
		_do_minus = true;
		ObPlayer.BinocularsActive = true;
		ObPlayer.alarm[1] = 1200;
		
		camera_set_view_size(view_camera[0], 192 + 64, 108 + 36);
		surface_resize(application_surface, 192 + 64, 108 + 36);
		
	break;
	case 7:
		_do_minus = true;
		ObPlayer.DetectorActive = true;
		ObPlayer.alarm[2] = 600;
		
	break;
}

if (_do_minus){
	Stacks[_cell] --;
	if (Stacks[_cell] <= 0){
		Items[_cell] = 0;
	}
	
	audio_play_sound(snd_item_use, 13, false, random_range(0.1, 0.2), 0, random_range(0.7, 1.3));
}