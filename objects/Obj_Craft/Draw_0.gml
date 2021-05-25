/// @description Insert description here
// You can write your code in this editor
if(valid){
	draw_rectangle(x,y,x+16,y+16,true)

	//draw_text(23*16,0,mode)
	draw_set_alpha(0.5)
	switch(mode){
		case 0:	break;
		case 1: draw_sprite(Spr_Fruitset,0,x,y); break;
		case 2:	draw_sprite(Spr_Woodset ,0,x,y); break;
		case 3:	draw_sprite(Spr_Stoneset,0,x,y); break;
		case 4:	draw_sprite(Spr_Goldset ,0,x,y); break;
		case 5:	draw_sprite(Spr_Fruitset,0,x,y); break;
		case 6: draw_sprite(Spr_Crop	,0,x,y); break;
		case 7: draw_sprite(Spr_Market	,0,x,y); break;
	}
	draw_set_alpha(1)

	if(fruit>0) draw_text(3*16,0,fruit)
	if(wood>0) draw_text(5*16,0,wood)
	if(stone>0) draw_text(7*16,0,stone)
	if(gold>0) draw_text(9*16,0,gold)
}