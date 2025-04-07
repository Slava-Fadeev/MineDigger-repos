XSpeed = keyboard_check(ord("D")) - keyboard_check(ord("A"));
image_speed = 1;

if (XSpeed != 0){
	image_xscale = XSpeed;
	
	if (sprite_index == SpPlayer){
		sprite_index = SpPlayerMove;
	}
}else{
	if (sprite_index == SpPlayerMove){
		//sprite_index = SpPlayerMove;
		image_speed = 8;
	}
}

XSpeed *= 2;
YSpeed += 0.5;
YSpeed = clamp(YSpeed, -7, 8);

if place_meeting(x, y + 1, [global.BlocksLayerTilemap, ObEndBlock]){
	YSpeed = 0;
}
if place_meeting(x, y + 3, [global.BlocksLayerTilemap, ObEndBlock]){
	if keyboard_check(vk_space){
		YSpeed = -5;
	}
}

move_and_collide(XSpeed, YSpeed, [global.BlocksLayerTilemap, ObEndBlock], 12, 0, 0, 4, 4);

if place_meeting(x, y - 1, [global.BlocksLayerTilemap, ObEndBlock]){
	YSpeed = 1;
}

//x = round(x);
//y = round(y);

Depth = (ystart - y) div BS;

if (x != xprevious || y != yprevious){
	var _cam = view_camera[0];
	var _w = camera_get_view_width(_cam) / 2;
	var _h = camera_get_view_height(_cam) / 2;
	
	camera_set_view_pos(_cam, x - _w + BS - 12, y - _h + 8);
}

if (Health <= 0){
	instance_create_depth(x, y, -999, ObDeathScreen);
}