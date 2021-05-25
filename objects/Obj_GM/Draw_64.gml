/// @description Insert description here
// You can write your code in this editor
// if(!instance_exists(Obj_Human))
if(!instance_exists(Obj_Human))
{
	draw_set_alpha(0.6)
	draw_set_color(c_black)
	draw_rectangle(0,0,room_width,room_height,false)
	draw_set_alpha(1)
	draw_sprite(Spr_GameOver,0,0,110);
}