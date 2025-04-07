randomize();
Height = 10_000;

global.FontDepth = font_add_sprite_ext(SpDepthNumbers, "0123456789M", true, 1);
global.FontMoney = font_add_sprite_ext(SpMoneyNumbers, "0123456789M", true, 1);
global.FontInventory = font_add_sprite_ext(SpInventoryNumbers, "012", true, 1);
global.FontShop = font_add_sprite_ext(SpShopNumbers, "0123456789M", true, 1);
global.FontDeath = font_add_sprite_ext(SpDeathNumbers, "0123456789MDbest:/", true, 1);
global.Font = font_add_sprite_ext(SpFont, "abcdefghijklmnopqrstuvwxyz0123456789", true, 1);

global.BombsLayer				= layer_create(-1);
global.BombsLayerTilemap	= layer_tilemap_create(global.BombsLayer, 0, 0, TiBombs, room_width div BS, Height); // 2 chunks - width; 3 chunks - height
layer_set_visible(global.BombsLayer, false);

global.BlocksLayer			= layer_create(-1);
global.BlocksLayerTilemap	= layer_tilemap_create(global.BlocksLayer, 0, 0, TiBlocks, room_width div BS, Height);

global.BacksLayer				= layer_create(1);
global.BacksLayerTilemap	= layer_tilemap_create(global.BacksLayer, 0, 0, TiBack, room_width div BS, Height);

global.BoimeMap = ds_list_create();
global.BoimeMapBack = ds_list_create();

for(var i = 0; i < Height div CHUNKH; i++){
	if (i < 4){
		global.BoimeMap[| i] = Biome.Standart;
		global.BoimeMapBack[| i] = Biome.StandartBack;
		continue;
	}
	
	var _prev_biome = global.BoimeMap[| i - 1];
	var _prev_biome_b = global.BoimeMapBack[| i - 1];
	if (irandom(1) == 1){
		global.BoimeMap[| i] = _prev_biome;
		global.BoimeMapBack[| i] = _prev_biome_b;
		continue;
	}
	
	var _b = irandom_range(1, 2);
	var _curr_b = Biome.Standart;
	var _curr_bb = Biome.StandartBack;
	switch(_b){
		case 1:
			var _curr_b = Biome.Standart;
			var _curr_bb = Biome.StandartBack;
		break;
		case 2:
			var _curr_b = Biome.Sandbiome;
			var _curr_bb = Biome.SandbiomeBack;
		break;
	}
	
	global.BoimeMap[| i]			= _curr_b;
	global.BoimeMapBack[| i]	= _curr_bb;
}

for(var i = 0; i < 2; i++){
	for(var j = -1; j < 2; j++){
		var _chunk = instance_create_depth(i * CHUNKW * BS, j * CHUNKH * BS, 0, ObChunk);
		_chunk.ChunkX = i;
		_chunk.ChunkY = j;
		_chunk.generate_terrain();
	}
}