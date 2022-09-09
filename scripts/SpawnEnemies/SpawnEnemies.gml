//For as long as lane 1 isn't full, it'll fill it with enemies from the pool.
while ds_list_size(global.lane_1) < 3 && ds_list_size(enemy_pool) > 0
{
	with (instance_create_layer(GRID_3,LANE_1,"LANE1",ds_list_find_value(enemy_pool,0)))
	{
		my_lane = 1;
		ds_list_add(global.lane_1,self);
	}
	ds_list_delete(enemy_pool,0);
}
//Same is true of lane 2.
while ds_list_size(global.lane_2) < 3 && ds_list_size(enemy_pool) > 0
{
	with (instance_create_layer(GRID_6,LANE_2,"LANE2",ds_list_find_value(enemy_pool,0)))
	{
		my_lane = 2;
		ds_list_add(global.lane_2,self);
	}
	ds_list_delete(enemy_pool,0);
}
//Once both loops are complete, it'll progress to the state change, going to the player's turn.