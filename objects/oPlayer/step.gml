if (hascontrol)
{
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space) or keyboard_check(ord("W")) or keyboard_check(vk_up);
}
else
{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}

var move = key_right - key_left;

hsp = move * walksp;
vsp = vsp + grv;

if (canjump < 1) and (key_jump)
{
	if (canjump == 0)
	{
		vsp = -7;
		canjump = 1;
	}
}

if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
	
}
y = y + vsp;

if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerJ;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else 
{
	canjump = 0;
	if (sprite_index == sPlayerJ) 
	{
		audio_sound_pitch(snLanding,choose(0.8,1.0,1.2));
		audio_play_sound(snLanding,6,false);
	}
	image_speed = 1;
	if (hsp == 0)
	{
			sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerR;	
	}
}

if (hsp != 0) image_xscale = sign(hsp);
