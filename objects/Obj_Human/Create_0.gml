/// @description Insert description here
// You can write your code in this editor
image_speed=0;
image_alpha=0;
// moving speed
sp=1

hpmax = 200;
hp = hpmax;

hgmax = 50;
hg = hgmax;


find_slime = false;
find_fruit = false;
find_asset = false;

state = noone;

enum STATE{
	gotoSlime,
	gotoFruit,
	gotoAsset,
	Attack,
	Eat,
	Collect,
	Walk,
}

hgcd = 60;
alarm[1] = hgcd;

recoverhp = 2;
recovercd = 30;

alarm[5]=recovercd;

anycd = 30;

