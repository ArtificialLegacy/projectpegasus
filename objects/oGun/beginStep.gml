x = oPlayer.x;
y = oPlayer.y+10;

image_angle = point_direction(x,y,mouse_x,mouse_y);

recoilz = max(0,recoilz-1);

if (image_angle > 90) and (image_angle < 270)
{
	image_yscale = -1;
	bullet_dir = -10;
}
else
{
	image_yscale = 1;	
	bullet_dir = 10;
}

x = x - lengthdir_x(recoilz,image_angle);
y = y - lengthdir_y(recoilz,image_angle);
