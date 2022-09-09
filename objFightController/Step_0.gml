/// @description Handling of the fight
global.front_enemy_1 = ds_list_find_value(global.lane_1,0);
global.front_enemy_2 = ds_list_find_value(global.lane_2,0);

//The state machine for the fight.
switch state
{
	//Fills the enemy_pool data structure with bullshit
	case fight_states.STARTUP:
	if global.endless == false
	{StoryPool()}
	else
	{EndlessPool()}
	state = fight_states.SPAWN;
	break;
	//Fills the empty spaces on the grid with bullshit.
	case fight_states.SPAWN:
	SpawnEnemies();
	state = fight_states.ROUNDSTART;
	break;
	//The round begins, and all effects of that ensue.
	case fight_states.ROUNDSTART:
	rounds++;
	RoundStart();
	state = fight_states.PICKCHARACTER;
	break;
	//The player chooses which character to take the actions of.
	//As this happens, ProgressFight is checking for if all enemies are dead. If so, spawns the boss.
	case fight_states.PICKCHARACTER:
	PickingCharacter();
	break;
	//The player takes their chosen character's actions.
	case fight_states.ATTACK:
	with (chosen_character) {CharacterAttacking();}
	break;
	//The front-most enemy in lane 1 fights back.
	case fight_states.RETALIATE1:
	if instance_exists(objIntent1)
	{objIntent1.x -= 10}
	else{state = fight_states.RETALIATE2}
	break;
	//Then the second. After which it loops back around to 'spawn'.
	case fight_states.RETALIATE2:
	if instance_exists(objIntent2)
	{objIntent2.x -= 10}
	else{state = fight_states.SPAWN}
	break;
	//The boss spawns in.
	case fight_states.SPAWNBOSS:
	with (instance_create_layer(GRID_3,LANE_1,"LANE1",objDean)) {my_lane = 2;ds_list_add(global.lane_2,self);}
	state = fight_states.ROUNDSTART;
	break;
	//Player death is handled.
	case fight_states.DEFEAT:
	if global.first_character.current_hp <= 0 && !instance_exists(objDeath)
	{
		with (instance_create_layer(0,0,"Death",objDeath)) {killer = global.front_enemy_1.object_index}
	}
	if global.second_character.current_hp <= 0 && !instance_exists(objDeath)
	{
		with (instance_create_layer(0,0,"Death",objDeath)) {killer = global.front_enemy_2.object_index}
	}
	if keyboard_check_pressed(ord("Z")){room_restart();}
	if keyboard_check_pressed(ord("X")){with (instance_create_layer(0,0,"Instances",objTransition)){destination = TITLE}}
	break;
}
