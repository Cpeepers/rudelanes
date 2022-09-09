//Generate a new seed.
randomize();
//Initializes the important ds_lists for the fir
enemy_pool = ds_list_create();
//Generates the variables for character selection.
global.front_enemy_1 = 0;
global.front_enemy_2 = 0;
global.lane_1 = ds_list_create();
global.lane_2 = ds_list_create();
chosen_character = noone;
//Spawns the characters in.
with (instance_create_layer(STANDBY_1,LANE_1,"Lane1",global.first_character))
{
	my_lane = 1;
	in_lane = 1;
}
with (instance_create_layer(STANDBY_2,LANE_2,"Lane2",global.second_character))
{
	my_lane = 2;
	in_lane = 2;
}

rounds = 0;
pirou_chance = 15;
state = fight_states.STARTUP