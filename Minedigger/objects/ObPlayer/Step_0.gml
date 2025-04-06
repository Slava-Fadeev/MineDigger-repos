var _move_x = keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));
var _move_y = keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));

if (!collision_point(x + _move_x * BS, y, [global.BlocksLayerTilemap, ObEndBlock], 0, 1)){
	x += _move_x * BS;
	
	if (_move_x != 0){
		image_xscale = _move_x;
		if (sprite_index == SpPlayer){
			image_index = 1;
			sprite_index = SpPlayerMove;
		}
	}
}
if (!collision_point(x, y + _move_y * BS, [global.BlocksLayerTilemap, ObEndBlock], 0, 1)){
	if (_move_y = -1){
		if (!collision_point(x - BS, y, global.BlocksLayerTilemap, 0, 1)
		&&  !collision_point(x + BS, y, global.BlocksLayerTilemap, 0, 1)){
			exit;
		}
		if (sprite_index == SpPlayer){
			image_index = 1;
			sprite_index = SpPlayerMove;
		}
	}
	y += _move_y * BS;
	Depth += _move_y;
	

}

if (!collision_point(x - BS, y + BS, global.BlocksLayerTilemap, 0, 1)
&&  !collision_point(x + BS, y + BS, global.BlocksLayerTilemap, 0, 1)
&&  !collision_point(x, y + BS, global.BlocksLayerTilemap, 0, 1)){
	y += 1 * BS;
	Depth += 1;
}

if (x != xprevious || y != yprevious){
	var _cam = view_camera[0];
	var _w = camera_get_view_width(_cam) / 2;
	var _h = camera_get_view_height(_cam) / 2;
	
	camera_set_view_pos(_cam, x - _w + BS - 12, y - _h + 8);
}else{
	if (collision_point(x + _move_x * BS, y + _move_y * BS, global.BlocksLayerTilemap, 0, 1)){
		var _tile = tilemap_get(global.BlocksLayerTilemap, (x + _move_x * BS) div BS, (y + _move_y * BS) div BS);
		var _bomb = tilemap_get(global.BombsLayerTilemap, (x + _move_x * BS) div BS, (y + _move_y * BS) div BS);
		if (_bomb){
			Health -= 1;
			instance_create_depth(x + _move_x * BS, y + _move_y * BS, -12, ObExplode);
		}
		image_index = 0;
		sprite_index = SpPlayerDigRight;
		if (_move_y == 1){
			sprite_index = SpPlayerDigDown;
		}
		particles(x + (_move_x * BS), y + (_move_y * BS), 3, [c_dirt]);
		
		switch(_tile){
			case Ore.Emerald:
			case Ore.Emerald2:
			case Ore.Emerald3:
				Money += 10;
				particles(x + (_move_x * BS), y + (_move_y * BS), 5, [c_emerald, c_emerald2]);
			break;
			case Ore.DirtWithGrass:
			case Ore.DirtWithGrass2:
			case Ore.DirtWithGrass3:
				Money += 1;
				particles(x + (_move_x * BS), y + (_move_y * BS), 4, [c_dirt, c_emerald, c_emerald2]);
			break;
			case Ore.EmeraldFake:
			case Ore.EmeraldFake2:
			case Ore.EmeraldFake3:
				Money += 3;
				Health -= 1;
				instance_create_depth(x + (_move_x * BS), y + (_move_y * BS), -12, ObExplode);
				particles(x + (_move_x * BS), y + (_move_y * BS), 8, [c_emerald, c_emerald, c_emerald2]);
			break;
		}
		
		tilemap_set(global.BlocksLayerTilemap, 0, (x + _move_x * BS) div BS, (y + _move_y * BS) div BS);
		tilemap_set(global.BombsLayerTilemap, 0, (x + _move_x * BS) div BS, (y + _move_y * BS) div BS);
	}
}