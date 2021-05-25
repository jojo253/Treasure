if(hp<=0) instance_destroy()

/// @description Insert description here
// You can write your code in this editor

depth = -y

// nearest
nh=instance_nearest(x,y,Obj_Human);

if(nh) find_human = distance_to_object(nh)<5*16
else find_human = false;

// attack enermy
if(find_human and
	(state == noone or state == SLIMESTATE.Walk))
{
	show_debug_message("->human")
	state = SLIMESTATE.gotoHuman
	move_towards_point(nh.x,nh.y,sp)
}

if(state == SLIMESTATE.gotoHuman and !find_human){
	show_debug_message("no->human")
	state = noone
}

// attack
if(nh){
	if((state != SLIMESTATE.Attack) and distance_to_object(nh)<4) {
		show_debug_message("attack")
		state = SLIMESTATE.Attack;
		speed = 0;
		alarm[4] = 1;
	}
}
if (state == SLIMESTATE.Attack and distance_to_object(nh)>=4){
	show_debug_message("no attack")
	state = noone;
	speed = 0;
	alarm[4] = 0;
}

// random walk
if(state == noone and
	!find_human){
	show_debug_message("walk")
	state = SLIMESTATE.Walk;
	speed = 0;
	alarm[0] = 1;
}

if(state != SLIMESTATE.Walk) alarm[0]=0;
if(state != SLIMESTATE.Attack) alarm[4]=0;

// border
if(x<=16) x = 16;
if(y<=16) y = 16;
if(x>=16*(global.w+1)) x=16*(global.w+1);
if(y>=16*(global.h+1)) y=16*(global.h+1);

if (state == SLIMESTATE.Attack){
	dir = point_direction(x,y,nh.x,nh.y)
	if(dir< 45   or  dir>=45*7) sprite_index = Spr_SlimeRight
	if(dir>=45   and dir< 45*3) sprite_index = Spr_SlimeUp
	if(dir>=45*3 and dir< 45*5) sprite_index = Spr_SlimeLeft
	if(dir>=45*5 and dir< 45*7) sprite_index = Spr_SlimeDown
	image_index+=0.2
}
else{
	if(direction< 45   or  direction>=45*7) sprite_index = Spr_SlimeRight
	if(direction>=45   and direction< 45*3) sprite_index = Spr_SlimeUp
	if(direction>=45*3 and direction< 45*5) sprite_index = Spr_SlimeLeft
	if(direction>=45*5 and direction< 45*7) sprite_index = Spr_SlimeDown
	image_index+=speed*0.1
}
