if my_lane == 1
{
	//If she's in the first lane, it stores her current index in the appropriate ds_list.
	//She moves appropriately as this changes.
	my_position = ds_list_find_index(global.lane_1,self)
	switch my_position
	{
		case 0: x = lerp(x,GRID_1,.15);
		break;
		case 1: x = lerp(x,GRID_2,.15);
		break;
		case 2: x = lerp(x,GRID_3,.15);
		break;
	}
}
if my_lane == 2
{
	//Same is true of the second lane.
	my_position = ds_list_find_index(global.lane_2,self)
	switch my_position
	{
		case 0: x = lerp(x,GRID_4,.15);
		break;
		case 1: x = lerp(x,GRID_5,.15);
		break;
		case 2: x = lerp(x,GRID_6,.15);
		break;
	}
}