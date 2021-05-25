// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


/// @function                 Asset_Gen([obj]);
/// @param {obj}  [obj]  Generater object
/// @description              Generater an asset object
function Asset_Gen(){
	xx=16*(irandom(global.w)+1);
	yy=16*(irandom(global.h)+1);
	with(Obj_Asset){
		if(x==other.xx and y==other.yy){
			continue
		}
	}
	
	if(argument_count>0) obj=argument0;
	else{
		obj_num=irandom(2);
		switch(obj_num){
			case 0:
				obj = Obj_Goldmine; 
			break;
			case 1:
				obj = Obj_Stone;
			break;
			case 2:
				obj = Obj_Tree;
			break;
		}
	}
	instance_create_depth(xx,yy,-1,obj)
}

function Resourse_Set(rset,amt){
	if(amt>0)
	{
		has_set=false
		if(instance_exists(rset)){
			with(rset){
				if(distance_to_object(other)<=3*16){
					amount+=amt
					other.has_set=true
				}
			}
		}

		if(!has_set){
			valid=false;
			while(!valid){
				xx=normalize(x+16*(irandom_range(-2,2)),global.w);
				yy=normalize(y+16*(irandom_range(-2,2)),global.h);
			
				with(Obj_Asset){
					if(x==other.xx and y==other.yy){
						continue
					}
				}
		
				with(Obj_Set){
					if(x==other.xx and y==other.yy){
						continue
					}
				}
				valid=true;
			}
			
			new_set=instance_create_depth(xx,yy,-1,rset)
			new_set.amount=amt
		}
	}
}

function normalize(x,wh){
	if x<16 return 16
	if x>wh*16 return wh*16
	return x
}

function costfunc(obj,cost){
	var restcost=cost
	with(obj){
		if(distance_to_object(other)<CRAFTDIST){
			reduce=min(amount,restcost)
			restcost-=reduce
			amount-=reduce
		}
	}
}