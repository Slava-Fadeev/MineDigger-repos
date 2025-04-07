DigFrame++;
var _dir = point_direction(x, y, mouse_x, mouse_y);
var _x = x + lengthdir_x(BS, _dir);
var _y = y + lengthdir_y(BS, _dir);

if (DigFrame % 10 != 0){
	exit;
}

var _tile = tilemap_get_at_pixel(global.BlocksLayerTilemap, _x, _y);
var _bomb = tilemap_get_at_pixel(global.BombsLayerTilemap, _x, _y);


if (_bomb){
	Health -= 1;
	HeartLoss = true;
	instance_create_depth(_x, _y, -12, ObExplode);
}

if (!_tile || (_tile >= Ore.ShopHeart && _tile <= Ore.ShopDiffuser)){
	exit;
}

image_index = 0;
sprite_index = SpPlayerDigRight;
if (_y - y >= 1){
	sprite_index = SpPlayerDigDown;
}
ObAchievement.Blocks ++;

switch(_tile){
	case Ore.Emerald:
	case Ore.Emerald2:
	case Ore.Emerald3:
		ObAchievement.Emeralds ++;
		Money += 4;
		particles(_x, _y, 5, [c_emerald, c_emerald2]);
	break;
	case Ore.Diamond:
	case Ore.Diamond2:
	case Ore.Diamond3:
		ObAchievement.Diamonds ++;
		Money += 16;
		particles(_x, _y, 7, [c_diamond, c_diamond2, c_dirt]);
	break;
	case Ore.DiamondFake:
	case Ore.DiamondFake2:
	case Ore.DiamondFake3:
		Health -= 1;
		HeartLoss = true;
		instance_create_depth(_x, _y, -12, ObExplode);
		particles(_x, _y, 7, [c_diamond, c_diamond2, c_diamond2, c_dirt]);
	break;
	case Ore.Gold:
	case Ore.Gold2:
	case Ore.Gold3:
		ObAchievement.Golds ++;
		Money += 33;
		particles(_x, _y, 7, [c_dyellow, c_lyellow, c_dblue, c_lblue]);
	break;
	case Ore.GoldFake:
	case Ore.GoldFake2:
	case Ore.GoldFake3:
		Health -= 1;
		HeartLoss = true;
		instance_create_depth(_x, _y, -12, ObExplode);
		particles(_x, _y, 7, [c_dyellow, c_lyellow, c_dblue, c_lblue]);
	break;
	case Ore.DirtWithGrass:
	case Ore.DirtWithGrass2:
	case Ore.DirtWithGrass3:
		particles(_x, _y, 4, [c_dirt, c_emerald, c_emerald2]);
	break;
	case Ore.EmeraldFake:
	case Ore.EmeraldFake2:
	case Ore.EmeraldFake3:
		Money += 3;
		Health -= 1;
		HeartLoss = true;
		instance_create_depth(_x, _y, -12, ObExplode);
		particles(_x, _y, 8, [c_emerald, c_emerald, c_emerald2]);
	break;
	
	case Ore.ShopBlock:
	case Ore.ShopBlock2:
	case Ore.ShopBlock3:
		particles(_x, _y, 8, [c_dblue, c_wcblue, c_dblue]);
	break;
	case Ore.Plank:
	case Ore.Plank + 1:
	case Ore.Plank + 2:
		particles(_x, _y, 8, [c_plank, c_dplank, c_ddplank]);
	break;
	case Ore.Vase:
	case Ore.Vase + 1:
	case Ore.Vase + 2:
		ObAchievement.Vases ++;
		var _emerald_particles = [c_emerald, c_emerald2];
		var _diamonds_particles = [c_emerald, c_emerald2, c_diamond, c_diamond2];
		var _temp = irandom_range(10, 31);
		Money += _temp;
		particles(_x, _y, 8, [c_plank, c_dblue, c_ddplank]);
		particles(_x, _y, 4, _temp <= 15 ? _emerald_particles : _diamonds_particles);
	break;
	default:
		particles(_x, _y, 3, [c_dirt]);
	break;
}

tilemap_set_at_pixel(global.BlocksLayerTilemap, 0, _x, _y);
tilemap_set_at_pixel(global.BombsLayerTilemap, 0, _x, _y);


/*
draw_set_alpha(0.55);
draw_sprite(SpSelect, 0, BS / 2 + (x + _x) div BS * BS, BS / 2 + (y + _y) div BS * BS);
draw_set_alpha(1);