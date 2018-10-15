with (other)
{
	hp -= other.damage;
	flash = 3;
	hitfrom = other.direction;
}

instance_destroy();
