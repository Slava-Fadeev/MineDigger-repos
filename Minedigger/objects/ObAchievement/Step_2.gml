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
if (Gold % 50 == 0 && Gold > LastGold){
	Achievement = "Golds";
	alarm[0] = 300;
	LastGold += 50;
	exit;
}