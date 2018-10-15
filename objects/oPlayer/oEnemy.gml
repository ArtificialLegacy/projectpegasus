hp--;
if (hp <= 0)
{
	with (oGun) instance_destroy();
	instance_change(oPDead,true);
	
	with (oUI)
	{
		slotName = array_create(3, "empty");
		slotDamage = array_create(3, 0);
		slotBulletSpeed = array_create(3, 0);
		slotRecoil = array_create(3, 0);
		slotFiringDelay = array_create(3, 0);
		slotBloomRate = array_create(3, 0);
		slot = 0;
	}

	direction = point_direction(other.x,other.y,x,y);
	hsp = lengthdir_x(6,direction);
	vsp = lengthdir_y(4,direction)-2;
	if (sign(hsp) != 0) image_xscale = sign(hsp);
}
