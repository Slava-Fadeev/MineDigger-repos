randomize();

global.FontDepth = font_add_sprite_ext(SpDepthNumbers, "0123456789M", true, 1)
global.FontMoney = font_add_sprite_ext(SpMoneyNumbers, "0123456789M", true, 1)

global.BombsLayer				= layer_create(-1);
global.BombsLayerTilemap	= layer_tilemap_create(global.BombsLayer, 0, 0, TiBombs, room_width div BS, 10_000); // 2 chunks - width; 3 chunks - height
layer_set_visible(global.BombsLayer, false);

global.BlocksLayer			= layer_create(-1);
global.BlocksLayerTilemap	= layer_tilemap_create(global.BlocksLayer, 0, 0, TiBlocks, room_width div BS, 10_000);

global.BacksLayer				= layer_create(1);
global.BacksLayerTilemap	= layer_tilemap_create(global.BacksLayer, 0, 0, TiBack, room_width div BS, 10_000);

for(var i = 0; i < 2; i++){
	for(var j = -1; j < 2; j++){
		var _chunk = instance_create_depth(i * CHUNKW * BS, j * CHUNKH * BS, 0, ObChunk);
		_chunk.ChunkX = i;
		_chunk.ChunkY = j;
		_chunk.generate_terrain();
	}
}