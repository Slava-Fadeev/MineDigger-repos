alarm[0] = 30

if (!instance_exists(ObPlayer)){
	exit
}

audio_sound_gain(global.musCave, clamp(-1 - ObPlayer.Depth / 10, 0, 1), 500);

var _tile = tilemap_get(global.BlocksLayerTilemap, ObPlayer.x div BS, ObPlayer.y div BS + 1);

if (_tile >= 41 && _tile <= 43){
	audio_sound_gain(global.musCave, 0, 200);
	audio_sound_gain(global.musShop, 0.5, 500);
}else{
	audio_sound_gain(global.musShop, 0, 500);
}