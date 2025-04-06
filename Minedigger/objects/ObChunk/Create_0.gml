alarm[0] = 1;
Bombs = ds_grid_create(CHUNKW, CHUNKH);
Blocks = ds_grid_create(CHUNKW, CHUNKH);

ChunkX = 0;
ChunkY = get_chunk_pos_y(y);
BlockY = irandom_range(7, CHUNKH - 7);

generate_bombs = function(_count = 20){
	if (ChunkY >= 1){
		repeat(_count){
			var _x = irandom(CHUNKW);
			var _y = irandom(CHUNKH);
			tilemap_set(global.BombsLayerTilemap, 1, ChunkX * CHUNKW + _x, y div BS + _y);
		}
	}
}
generate_terrain = function(){
	if (ChunkY == 0){
		for(var i = 0; i < CHUNKW; i++){
			BlockY += choose(0, 1, -1, 0, 0, 0);
			BlockY = clamp(BlockY, 7, CHUNKH - 7);
		
			tilemap_set(global.BlocksLayerTilemap, 31 + (i % 3), ChunkX * CHUNKW + i, y div BS + BlockY);
			tilemap_set(global.BacksLayerTilemap, 1 + (i % 3), ChunkX * CHUNKW + i, y div BS + BlockY);
			for(var j = BlockY; j < CHUNKH; j++){
				tilemap_set(global.BlocksLayerTilemap, 1 + (i % 3), ChunkX * CHUNKW + i, y div BS + j + 1);
				tilemap_set(global.BacksLayerTilemap, 5 + (i % 3), ChunkX * CHUNKW + i, y div BS + j + 1);
			}
		}
	}
}
generate_fill = function(_ores = 2){
	for(var i = 0; i < CHUNKW; i++){
		for(var j = 0; j < CHUNKH; j++){
			tilemap_set(global.BlocksLayerTilemap, 1 + (i % 3), ChunkX * CHUNKW + i, y div BS + j);
			tilemap_set(global.BacksLayerTilemap, 5 + (i % 3), ChunkX * CHUNKW + i, y div BS + j);
		}
	}
	
	repeat(_ores){
		var _x = irandom(CHUNKW);
		var _y = irandom(CHUNKH);
		
		for(var i = 0; i < irandom(CHUNKW); i++){
			for(var j = 0; j < irandom(CHUNKH); j++){
				_x += irandom_range(-1, 1);
				_y += irandom_range(-1, 1);
				tilemap_set(global.BlocksLayerTilemap, choose(11, 11, 11, 21) + (i % 3), ChunkX * CHUNKW + _x, y div BS + _y);
			}
		}
		
	}
}
save = function(){
	var _buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(_buff, buffer_seek_start, 0);
	
	for(var i = 0; i < CHUNKW; i++){
		for(var j = 0; j < CHUNKH; j++){
			buffer_write(_buff, buffer_u8, tilemap_get(global.BlocksLayerTilemap, ChunkX * CHUNKW + i, y div BS + j));
		}
	}
	for(var i = 0; i < CHUNKW; i++){
		for(var j = 0; j < CHUNKH; j++){
			buffer_write(_buff, buffer_u8, tilemap_get(global.BombsLayerTilemap, ChunkX * CHUNKW + i, y div BS + j));
		}
	}
	
	buffer_save(_buff, $"ChunkX {ChunkX} ChunkY {ChunkY}");
	
	buffer_delete(_buff);
}
load = function(){
	var _buff = buffer_load($"ChunkX {ChunkX} ChunkY {ChunkY}");
	if (!_buff){
		show_debug_message("BUFFER WAS NOT FOUND");
		generate_fill();
		show_debug_message("UNDEFINED CHUNK CREATE");
		save();
		show_debug_message("UNDEFINED BUFFER SAVE");
		exit;
	}
	
	for(var i = 0; i < CHUNKW; i++){
		for(var j = 0; j < CHUNKH; j++){
			tilemap_set(global.BlocksLayerTilemap, buffer_read(_buff, buffer_u8) ,ChunkX * CHUNKW + i, y div BS + j)
		}
	}
	for(var i = 0; i < CHUNKW; i++){
		for(var j = 0; j < CHUNKH; j++){
			tilemap_set(global.BombsLayerTilemap, buffer_read(_buff, buffer_u8) ,ChunkX * CHUNKW + i, y div BS + j)
		}
	}
	
	buffer_delete(_buff);
	return 1;
}