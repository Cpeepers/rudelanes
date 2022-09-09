var all_enemies_defeated = ds_list_size(global.lane_1) = 0 && ds_list_size(global.lane_2) = 0 && ds_list_size(enemy_pool) = 0;
var out_of_actions = global.first_character.current_actions = 0 && global.second_character.current_actions = 0
var press_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_up);
var press_right =  keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_down);
var press_z = keyboard_check_pressed(ord("Z"));
var press_x = keyboard_check_pressed(ord("X"));
	
if press_left
	{
		chosen_character = global.first_character;
	}
if press_right 
	{
		chosen_character = global.second_character;
	}
	
if press_z && chosen_character.current_actions > 0
{
	state = fight_states.ATTACK;
}
//If all actions are spent, X is pressed, or all enemies are defeated, end the turn early.
if out_of_actions || ds_list_empty(global.lane_1) && ds_list_empty(global.lane_2) || press_x
{
	if all_enemies_defeated && !instance_exists(objDean)
	{state = fight_states.SPAWNBOSS;}
	else {state = fight_states.RETALIATE1}
}