var _dir = point_direction(x, y, mouse_x, mouse_y);
var _x = x + lengthdir_x(BS, _dir);
var _y = y + lengthdir_y(BS, _dir);

var _tile = tilemap_get_at_pixel(global.BlocksLayerTilemap, _x, _y);

if (!_tile){
	exit;
}
var _depth_penalty = 0;

if (Depth >= 300){
	var _depth_penalty = floor((Depth * 0.5));
}

switch(_tile){
	case Ore.ShopHeart:
		if(buy(Ore.ShopHeart, Prices[EPrices.Heart] + _depth_penalty)){
			particles(_x, _y, 8, [c_lred, c_dblue, c_lblue]);
		}
	break;
	case Ore.ShopScan:
		if(buy(Ore.ShopScan, Prices[EPrices.Scan] + _depth_penalty)){
			particles(_x, _y, 8, [c_dyellow, c_dblue, c_lblue]);
		}
	
	break;
	case Ore.ShopScanPlus:
		if(buy(Ore.ShopScanPlus, Prices[EPrices.ScanPlus] + _depth_penalty)){
			particles(_x, _y, 8, [c_dyellow, c_dblue, c_lblue]);
		}
	break;
	case Ore.ShopMedkit:
		if(buy(Ore.ShopMedkit, Prices[EPrices.Medkit] + _depth_penalty)){
			particles(_x, _y, 8, [c_mwhite, c_lred]);
		}
	break;
	case Ore.ShopDiffuser:
		if(buy(Ore.ShopDiffuser, Prices[EPrices.Diffuser] + _depth_penalty)){
			particles(_x, _y, 8, [c_dblue, c_lred]);
		}
	break;
}