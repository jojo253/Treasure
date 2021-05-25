/// @description Insert description here
// You can write your code in this editor

depth = -y;
if(image_alpha<1) image_alpha+=0.1;
if(hp<=0) instance_destroy();

// nearest
ns=instance_nearest(x,y,Obj_Slime);
nf=instance_nearest(x,y,Obj_Fruitset);
na=instance_nearest(x,y,Obj_Asset);

if(ns) find_slime = distance_to_object(ns)<3*16
else find_slime = false;

find_fruit = nf and hg/hgmax<0.3;

if(na) find_asset = distance_to_object(na)<3*16
else find_asset = false;

// attack enermy
if(find_slime and
	(state == noone or state == STATE.Walk))
{
	show_debug_message("->slime")
	state = STATE.gotoSlime
	move_towards_point(ns.x,ns.y,sp)
}

if(state == STATE.gotoSlime and !find_slime){
	show_debug_message("no->slime")
	state = noone
}

// eat when hungery
if(find_fruit and
	(state == noone or state == STATE.Walk))
{
	show_debug_message("->food")
	state = STATE.gotoFruit
	move_towards_point(nf.x,nf.y,sp)
}
if(state == STATE.gotoFruit and !find_fruit){
	show_debug_message("no->food")
	state = noone
}

// collect assets
if(find_asset and
	(state == noone or state == STATE.Walk))
{
	show_debug_message("->asset")
	state = STATE.gotoAsset
	move_towards_point(na.x,na.y,sp)
}
if(state == STATE.gotoAsset and !find_asset){
	show_debug_message("no->asset")
	state = noone
}

// attack
if(ns){
	if((state != STATE.Attack) and distance_to_object(ns)<4) {
		show_debug_message("attack")
		state = STATE.Attack;
		speed = 0;
		alarm[4] = 1;
	}
}
if (state == STATE.Attack and distance_to_object(ns)>=4){
	show_debug_message("no attack")
	state = noone;
	speed = 0;
	alarm[4] = 0;
}

// eat
if(nf){
	if((state != STATE.Attack and state != STATE.Eat) and
	distance_to_object(nf)<8 and
	hg<hgmax*0.7) {
		show_debug_message("eat")
		state = STATE.Eat;
		speed = 0;
		alarm[2] = 1;
	}
}
if (state == STATE.Eat and (distance_to_object(nf)>=8 or hg>=hgmax-5)){
	show_debug_message("no eat")
	state = noone;
	speed = 0;
	alarm[2] = 0;
}

// collect
if(na){
	if(state != STATE.Attack and state != STATE.Eat and state != STATE.Collect and distance_to_object(na)<8) {
		show_debug_message("collect")
		state = STATE.Collect;
		speed = 0;
		alarm[3] = 1;
	}
}
if (state == STATE.Collect and distance_to_object(na)>=8){
	show_debug_message("no collect")
	state = noone;
	speed = 0;
	alarm[3] = 0;
}



// random walk
if(state == noone and
	!find_fruit and
	!find_asset and
	!find_slime){
	show_debug_message("walk")
	state = STATE.Walk;
	speed = 0;
	alarm[0] = 1;
}

if(state != STATE.Walk) alarm[0]=0;
if(state != STATE.Eat) alarm[2]=0;
if(state != STATE.Collect) alarm[3]=0;
if(state != STATE.Attack) alarm[4]=0;

// border
if(x<=16) x = 16;
if(y<=16) y = 16;
if(x>=16*(global.w+1)) x=16*(global.w+1);
if(y>=16*(global.h+1)) y=16*(global.h+1);

if (state == STATE.Collect or state == STATE.Attack){
	if(state == STATE.Collect) dir = point_direction(x,y,na.x,na.y)
	if(state == STATE.Attack) dir = point_direction(x,y,ns.x,ns.y)
	if(dir< 45   or  dir>=45*7) sprite_index = Spr_HumanAtkRight
	if(dir>=45   and dir< 45*3) sprite_index = Spr_HumanAtkUp
	if(dir>=45*3 and dir< 45*5) sprite_index = Spr_HumanAtkLeft
	if(dir>=45*5 and dir< 45*7) sprite_index = Spr_HumanAtkDown
	image_index+=0.1
}
else{
	if(direction< 45   or  direction>=45*7) sprite_index = Spr_HumanRight
	if(direction>=45   and direction< 45*3) sprite_index = Spr_HumanUp
	if(direction>=45*3 and direction< 45*5) sprite_index = Spr_HumanLeft
	if(direction>=45*5 and direction< 45*7) sprite_index = Spr_HumanDown
	image_index+=speed*0.1
}
