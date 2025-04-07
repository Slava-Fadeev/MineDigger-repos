y = get_chunk_pos_y(ObPlayer.y) * CHUNKH * BS;

if (y != yprevious && instance_number(ObChunk) == 6){
	with(ObChunk){
		save();
		y = get_chunk_pos_y(ObPlayer.y) * CHUNKH * BS + ystart;
		ChunkY = get_chunk_pos_y(y);
		CurrentBiome = global.BoimeMap[| ChunkY];
		CurrentBiomeBack = global.BoimeMapBack[| ChunkY];
	}

	tilemap_clear(global.BombsLayerTilemap, 0);
	tilemap_clear(global.BlocksLayerTilemap, 0);
	tilemap_clear(global.BacksLayerTilemap, 0);

	with(ObChunk){
		if (!load()){
			generate_bombs();
			generate_terrain();
			generate_fill();
		}
	}
}