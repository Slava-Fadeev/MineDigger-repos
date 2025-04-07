instance_destroy(ObMusic);
instance_destroy(ObPlayer);
instance_destroy(ObEndBlock);
instance_destroy(ObChunkController);
instance_destroy(ObAchievement);

var _cam = view_camera[0];
var _x = camera_get_view_x(_cam);
var _y = camera_get_view_y(_cam);

instance_create_depth(_x, _y, -1999, ObButtonRetry);
instance_create_depth(_x, _y, -1999, ObButtonDExit);