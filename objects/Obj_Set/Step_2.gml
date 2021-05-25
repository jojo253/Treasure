/// @description Insert description here
// You can write your code in this editor
if(image_alpha<1) image_alpha+=0.1;
if(amount<=0) instance_destroy()

if(collision_point(x,y,Obj_Set,false,true)) instance_destroy()
if(collision_point(x,y,Obj_Building,false,true)) instance_destroy()