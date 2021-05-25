/// @description Insert description here
// You can write your code in this editor
draw_self()
if (hp!=hpmax) draw_healthbar(x,y-4,x+16,y,hp/hpmax*100,c_black, c_red, c_lime, 0, true, true)