/// @description Insert description here
// You can write your code in this editor
draw_self()

if (hp!=hpmax) draw_healthbar(x,y-4,x+16,y,hp/hpmax*100,c_black, c_red, c_lime, 0, true, true)
if (hg<hgmax/2) draw_healthbar(x,y-8,x+16,y-4,hg/hgmax*100,c_black, c_red, c_yellow, 0, true, true)

if(false){
draw_text(0,16+16  ,"find_asset:"+string(find_asset))
draw_text(0,16+16*2,"hg%:"+string(hg/hgmax))
draw_text(0,16+16*3,"dir:"+string(direction))
draw_text(0,16+16*4,"spd:"+string(speed))
draw_text(0,16+16*5,"state:"+string(state))

draw_text(0,16+16*7,"alarm0:"+string(alarm[0]))
//draw_text(0,16+16*8,"alarm1:"+string(alarm[1]))
draw_text(0,16+16*9,"alarm2:"+string(alarm[2]))
draw_text(0,16+16*10,"alarm3:"+string(alarm[3]))
draw_text(0,16+16*11,"alarm4:"+string(alarm[4]))
if(nf) draw_text(0,16+16*12,".->fruit:"+string(distance_to_object(nf)))
if(na) draw_text(0,16+16*13,".->asset:"+string(distance_to_object(na)))
if(ns) draw_text(0,16+16*14,".->slime:"+string(distance_to_object(ns)))
}