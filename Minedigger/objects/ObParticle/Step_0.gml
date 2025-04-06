YSpeed += 0.1 + (sin(current_time + x) / 4);
XSpeed = lerp(XSpeed, 0, 0.05);

y += YSpeed;
x += XSpeed;

image_alpha -= YSpeed / 30;
if (!image_alpha){
	instance_destroy()
}