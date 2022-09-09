//The state engine for the character select
enum select_states
{
	FIRSTPICK,
	FIRSTPICKED,
	SECONDPICK,
	SECONDPICKED
}
//The state engine for the fight.
enum fight_states
{
	STARTUP,
	SPAWN,
	ROUNDSTART,
	PICKCHARACTER,
	ATTACK,
	RETALIATE1,
	RETALIATE2,
	SPAWNBOSS,
	VICTORY,
	DEFEAT
}
//Thestate engine for transitions
enum transition_states
{
	START,
	HOLD,
	FINISH
}

#macro TITLE 0
#macro CHARSELECT 1
#macro FIGHT 2
#macro CONVO 3

//The y coordinates of lane 1 and 2
#macro LANE_1 185
#macro LANE_2 233
//The x coordinate for each important spot.
//STANDBY is where player characters who are waiting for their turn go. 
//ACTIVE is where the player character who's taking their turn goes.
//GRID 1-6 are where enemies go.
#macro STANDBY_1 45
#macro STANDBY_2 75
#macro ACTIVE_1 145
#macro ACTIVE_2 155
#macro GRID_1 254
#macro GRID_2 385
#macro GRID_3 495
#macro GRID_4 288
#macro GRID_5 435
#macro GRID_6 670