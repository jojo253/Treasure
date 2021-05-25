/// @description Insert description here
// You can write your code in this editor

tree_num=0
with(Obj_Tree){
	if(distance_to_object(other)<2*16)
	other.tree_num+=1
}
slime_prob=tree_num/15