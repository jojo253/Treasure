/// @description Insert description here
// You can write your code in this editor

if(image_alpha<1) image_alpha+=0.1;

if(hp<=0) {
	Resourse_Set(Obj_Fruitset,fruit);
	Resourse_Set(Obj_Woodset,wood);
	Resourse_Set(Obj_Goldset,gold);
	Resourse_Set(Obj_Stoneset,stone);
	instance_destroy()
}

// fix multi asset bug
if(collision_point(x,y,Obj_Asset,false,true)) instance_destroy()
if(collision_point(x,y,Obj_Set,false,true)) instance_destroy()
if(collision_point(x,y,Obj_Building,false,true)) instance_destroy()