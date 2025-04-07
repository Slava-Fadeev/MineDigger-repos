alarm[0] = 60;

var a = irandom_range(Ore.ShopHeart, Ore.ShopMineDetect);
var b = irandom_range(Ore.ShopHeart, Ore.ShopMineDetect);
var c = irandom_range(Ore.ShopHeart, Ore.ShopMineDetect);

ShopStructure = [
[41,42,43,41,42,43,41,42,43],
[41, 0, 0, 0, 0, 0, 0, 0,43],
[41, 0, a, 0, b, 0, c, 0,43],
[41, 0, 0, 0, 0, 0, 0, 0,43],
[41,42,43,41,42,43,41,42,43]
];
ShopStructureBack = [
[ 5, 6, 7, 5, 6, 7, 5, 6, 7],
[ 5, 6, 7, 5, 6, 7, 5, 6, 7],
[ 5, 6, 7, 5, 6, 7, 5, 6, 7],
[ 5, 6, 9, 5,10, 7,11, 6, 7],
[ 5, 6, 7, 5, 6, 7, 5, 6, 7]
];