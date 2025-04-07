depth = -10;
x -= 6;
y -= 6;
var _cam = view_camera[0];
var _w = camera_get_view_width(_cam) / 2;
var _h = camera_get_view_height(_cam) / 2;

camera_set_view_pos(_cam, x - _w + BS - 12, y - _h + 8);

HeartLossFrame = 0;
HeartLoss = false;

YSpeed = 0;
XSpeed = 0;

Money = 0;
Depth = 0;
Health = 300;

particles = function(_x, _y, _count, _particles_colors){
	repeat(_count){
		var _part = instance_create_depth(_x, _y, - 13, ObParticle);
		_part.image_blend = _particles_colors[irandom(array_length(_particles_colors) - 1)];
	}
}
buy = function(_item, _price){
	if (Money < _price){
		exit;
	}
	Money -= _price;
	
	for(var i = 0; i < array_length(ObInventoryCells.Items); i++){
		if (ObInventoryCells.Items[i] == _item - 70){
			if (ObInventoryCells.Stacks[i] < ObInventoryCells.StackM){
				ObInventoryCells.Stacks[i]++;
				break;
			}
		}else{
			if (ObInventoryCells.Items[i] == 0){
				ObInventoryCells.Items[i] = _item - 70;
				ObInventoryCells.Stacks[i]++;
				break;
			}
		}
	}
	
	return true;
}
DigFrame = 9;
NumbersSurface = -1;

ScannerActive = false;
ScannerRadius = 0;

Prices = [550, 200, 670, 790, 350, 135, 440];

enum EPrices{
	Heart,
	Scan,
	ScanPlus,
	Medkit,
	Diffuser,
	Binoculars,
	MineDetect
}
