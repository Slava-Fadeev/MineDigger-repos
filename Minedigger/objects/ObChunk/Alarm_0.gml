if (ChunkY == 1){
	generate_fill();
	
	if (ChunkX == 0){
		for(var i = 0; i < array_length(ObChunkController.ShopStructure); i++){
			for(var j = 0; j < array_length(ObChunkController.ShopStructure[i]); j++){
				tilemap_set(global.BlocksLayerTilemap, ObChunkController.ShopStructure[i][j], ChunkX * CHUNKW + j, y div BS + i);
				tilemap_set(global.BacksLayerTilemap, ObChunkController.ShopStructureBack[i][j], ChunkX * CHUNKW + j, y div BS + i);
			}
		}
	}
}