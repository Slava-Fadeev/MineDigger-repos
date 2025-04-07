for(var i = 0; i < 2; i++){
	for(var j = 0; j < 10_000; j++){
		if (file_exists($"ChunkX {i} ChunkY {j}")){
			file_delete($"ChunkX {i} ChunkY {j}");
		}else{
			break;
		}
	}
}

var a = irandom_range(Ore.ShopHeart, Ore.ShopDiffuser);
var b = irandom_range(Ore.ShopHeart, Ore.ShopDiffuser);
var c = irandom_range(Ore.ShopHeart, Ore.ShopDiffuser);

ShopStructure = [
[41,42,43,41,42,43,41,42,43,41,42,43,41,42,43,41],
[41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,41],
[41, 0, 0, 0, 0, 0, 0, 0, a, 0, b, 0, c, 0, 0,41],
[41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,41],
[41,42,43,41,42,43,41,42,43,41,42,43,41,42,43,41]
];
ShopStructureBack = [
[ 5, 6, 7, 5, 6, 7, 5, 6, 7, 5, 6, 7, 5, 6, 7, 5],
[ 5, 6, 7, 5, 6, 7, 5, 6, 7, 5, 6, 7, 5, 6, 7, 5],
[ 5, 6, 7, 5, 6, 7, 5, 6, 7, 5, 6, 7, 5, 6, 7, 5],
[ 5, 6, 7, 5, 6, 7, 5, 6, 9, 5,10, 7,11, 6, 7, 5],
[ 5, 6, 7, 5, 6, 7, 5, 6, 7, 5, 6, 7, 5, 6, 7, 5]
];