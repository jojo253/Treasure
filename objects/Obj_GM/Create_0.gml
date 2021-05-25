/// @description Insert description here
// You can write your code in this editor

randomize()

scl=3;
window_set_size(scl*400,scl*304);
started = false;

// width and height of the room
global.w = 22
global.h = 16

// setted max asset amont
K = 80;
Gamount = 1/30;
Gperiod = 600;

global.fruit=0
global.wood=0
global.gold=0
global.stone=0

// create asset at beginning
global.asset = 0

Asset_Gen(Obj_Goldmine)
Asset_Gen(Obj_Stone)
Asset_Gen(Obj_Tree)
Asset_Gen(Obj_Tree)

while(global.asset<=irandom_range(25,35)) Asset_Gen()

instance_create_depth(random_range(16,16*(global.w+1)),
					  random_range(16,16*(global.h+1)),
					  -1,Obj_Human)

alarm[0]=1;

#macro CRAFTDIST 4*16

// BGM
audio_play_sound(yourcraft,0,true);