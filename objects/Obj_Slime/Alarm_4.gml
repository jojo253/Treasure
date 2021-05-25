/// @description Attack
// You can write your code in this editor
if(nh){
	nh.hp-=5;
	alarm[4]=anycd;
	audio_play_sound(Weapon_Blow,0,false)
}
else state=noone;