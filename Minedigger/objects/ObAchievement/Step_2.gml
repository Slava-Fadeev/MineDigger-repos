if (ObPlayer.Depth % 100 == 0 && ObPlayer.Depth < LastDepth){
	Achievement = "Depth";
	alarm[0] = 300;
	LastDepth += 100;
	exit;
}
if (Diamonds % 50 == 0 && Diamonds > LastDiamonds){
	Achievement = "Diamonds";
	alarm[0] = 300;
	LastDiamonds += 50;
	exit;
}
if (Emeralds % 50 == 0 && Emeralds > LastEmeralds){
	Achievement = "Emeralds";
	alarm[0] = 300;
	LastEmeralds += 50;
	exit;
}
if (Golds % 50 == 0 && Golds > LastGolds){
	Achievement = "Golds";
	alarm[0] = 300;
	LastGolds += 50;
	exit;
}
if (Vases % 25 == 0 && Vases > LastVases){
	Achievement = "Vases";
	alarm[0] = 200;
	LastVases += 25;
	exit;
}
if (Blocks % 500 == 0 && Blocks > LastBlocks){
	Achievement = "Blocks";
	alarm[0] = 300;
	LastBlocks += 500;
	exit;
}