/// @func get_chunk_x(chunk x)
function get_chunk_x(_chunk_x){
	return _chunk_x div CHUNKW;
}

/// @func get_chunk_y(chunk y)
function get_chunk_y(_chunk_y){
	return _chunk_y div CHUNKH;
}
/// @func get_chunk_pos_x(chunk x)
function get_chunk_pos_x(_chunk_x){
	return _chunk_x div CHUNKW div BS;
}

/// @func get_chunk_pos_y(chunk y)
function get_chunk_pos_y(_chunk_y){
	return _chunk_y div CHUNKH div BS;
}