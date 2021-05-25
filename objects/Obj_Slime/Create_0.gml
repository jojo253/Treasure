/// @description Insert description here
// You can write your code in this editor

image_speed=0;

hpmax = 50;
hp = hpmax;

state = noone;

anycd = 30;

find_human=false;

sp=1.5;

enum SLIMESTATE{
	gotoHuman,
	Attack,
	Walk,
}

recoverhp = 1;
recovercd = 30;

alarm[5]=recovercd;