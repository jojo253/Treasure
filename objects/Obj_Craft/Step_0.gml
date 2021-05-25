/// @description Insert description here
// You can write your code in this editor
x=floor(mouse_x/16)*16;
y=floor(mouse_y/16)*16;

fruit = 0;
wood = 0;
stone = 0;
gold = 0;

valid = (x>=16 and x<=16*(global.w+1) and y>=16 and y<=16*(global.h+1))
if (valid){
	
	with(Obj_Fruitset){
		if(distance_to_object(other)<CRAFTDIST) other.fruit+=amount
	}
	with(Obj_Woodset){
		if(distance_to_object(other)<CRAFTDIST) other.wood+=amount
	}
	with(Obj_Stoneset){
		if(distance_to_object(other)<CRAFTDIST) other.stone+=amount
	}
	with(Obj_Goldset){
		if(distance_to_object(other)<CRAFTDIST) other.gold+=amount
	}

	if(mouse_wheel_up()) mode-=1
	if(mouse_wheel_down()) mode+=1

	if(mode==1){
		if(fruit<20){
			mode+=1
		}
		else{
			costfunc(Obj_Fruitset,20)
			craft_obj=instance_create_depth(x,y,-1,Obj_Fruitset)
			craft_obj.amount=5
		}
	}
	if(mode==2){
		if(wood<20) mode+=1
		else if(mouse_check_button_pressed(mb_left)){
			costfunc(Obj_Woodset,20)
			craft_obj=instance_create_depth(x,y,-1,Obj_Woodset)
			craft_obj.amount=5
		}
	}
	if(mode==3){
		if(stone<20) mode+=1
		else if(mouse_check_button_pressed(mb_left)){
			costfunc(Obj_Stoneset,20)
			craft_obj=instance_create_depth(x,y,-1,Obj_Stoneset)
			craft_obj.amount=5
		}
	}
	if(mode==4){
		if(gold<20) mode+=1
		else if(mouse_check_button_pressed(mb_left)){
			costfunc(Obj_Goldset,20)
			craft_obj=instance_create_depth(x,y,-1,Obj_Goldset)
			craft_obj.amount=5
		}
	}
	if(mode==5){
		if(fruit<50 or wood<50) mode+=1
		else if(mouse_check_button_pressed(mb_left)){
			costfunc(Obj_Fruitset,50)
			costfunc(Obj_Woodset,50)
			craft_obj=instance_create_depth(x,y,-1,Obj_House)
		}
	}
	if(mode==6){
		if(fruit<30 or gold<10) mode+=1
		else if(mouse_check_button_pressed(mb_left)){
			costfunc(Obj_Fruitset,30)
			costfunc(Obj_Goldset,10)
			craft_obj=instance_create_depth(x,y,-1,Obj_Crop)
		}
	}
	if(mode==7){
		if(wood<10 or stone<10 or gold<50) mode+=1
		else if(mouse_check_button_pressed(mb_left)){
			costfunc(Obj_Woodset,10)
			costfunc(Obj_Stoneset,10)
			costfunc(Obj_Goldset,50)
			craft_obj=instance_create_depth(x,y,-1,Obj_Market)
		}
	}

	if(mode<0) mode += 8
	if(mode>7) mode -= 8
}