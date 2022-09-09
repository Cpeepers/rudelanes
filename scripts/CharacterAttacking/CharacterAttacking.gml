var press_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_up);
var press_right =  keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_down);
var press_z = keyboard_check_pressed(ord("Z"));
var press_x = keyboard_check_pressed(ord("X"));
//Changes your lane based on inputs
if press_right
{
	in_lane++
}
if press_left
{
	in_lane--
}
//Handling what the player character can do in each lane, and what happens when z is pressed.
switch in_lane
{
	//Since there is no 'zero' lane, it simply underflows to 2.
	case 0: in_lane = 2;
	break;
	//Character moves to the appropriate spot in the first lane. If an enemy is there, they can hit 'em.
	//Otherwise they're moved to a different lane
	case 1: 
	if !ds_list_empty(global.lane_1)
	{
		x = lerp(x,ACTIVE_1,.3); y = lerp(y,LANE_1,.3);
		if current_actions > 0 && press_z
		{
			var damage_dealt = ((damage - global.front_enemy_1.armor)  * (global.front_enemy_1.vulnerable+1));
			hit_count++
			//If I'm Stirfry, and it's my second attack, I make them vulnerable.
			if self.object_index == objStirfry && hit_count >= 2
			{if !ds_list_empty(global.lane_1){with global.front_enemy_1{vulnerable = 1;}}hit_count = 0;}
			//And then the damage is compared to the target's HP.
			if global.front_enemy_1.current_hp <= damage_dealt {got_kill = true;}
			//If I'm Cordelia, I set my alarm that cleaves the other enemy for any overkill.
			if self.object_index == objCordelia && got_kill = true
			{overkill = damage_dealt - global.front_enemy_1.current_hp; alarm[3] = 2;}
			//Then, the enemy gets hit.
			with global.front_enemy_1
			{got_hit = true;
			var damage_taken = ((objFightController.chosen_character.damage  - armor) * (vulnerable+1));
			if damage_taken >= armor {current_hp -= damage_taken}}
			//If I'm Ivan, I heal for the damage I just dealt.
			if self.object_index == objIvan && damage_dealt > 0 {healing += damage_dealt}
			//And then my action is spent.
			current_actions--;
		}
	}
	else 
	{
		in_lane = 2;
	}
	break;
	//The same is true here, but it's for the second lane.
	case 2:
	if !ds_list_empty(global.lane_2)
	{
		x = lerp(x,ACTIVE_2,.3); y = lerp(y,LANE_2,.3);
		if current_actions > 0 && press_z
		{
			var damage_dealt = ((damage - global.front_enemy_2.armor) * (global.front_enemy_2.vulnerable+1));
			hit_count++;
			//If I'm Stirfry, and it's my second attack, I make them vulnerable.
			if self.object_index == objStirfry && hit_count >= 2
			{if !ds_list_empty(global.lane_2){with global.front_enemy_2{vulnerable = 1;}}hit_count = 0;}
			//And then the damage is compared to the target's HP.
			if global.front_enemy_2.current_hp <= damage_dealt {got_kill = true;}
			//If I'm Cordelia, I set my alarm that cleaves the other enemy for any overkill.
			if self.object_index == objCordelia && got_kill = true
			{overkill = damage_dealt - global.front_enemy_2.current_hp; alarm[4] = 2;}
			//Then, the enemy gets hit
			with global.front_enemy_2
			{got_hit = true;
			var damage_taken = ((objFightController.chosen_character.damage  - armor) * (vulnerable+1));
			if damage_taken >= armor {current_hp -= damage_taken}}
			//If I'm Ivan, I heal for the damage dealt.
			if self.object_index == objIvan && damage_dealt > 0 {healing += damage_dealt}
			//And then my action is spent.
			current_actions--;
		}
	}
	else
	{
		in_lane = 1;
	}
	break;
	case 3: in_lane = 1;
	break;
}

if current_actions <= 0 || press_x || ((ds_list_size(global.lane_1) = 0 && ds_list_size(global.lane_2) = 0))
{
	switch my_lane
	{
		case 1: x = STANDBY_1; y = LANE_1; in_lane = 1;
		break;
		case 2: x = STANDBY_2; y = LANE_2; in_lane = 2;
		break;
	}
	objFightController.state = fight_states.PICKCHARACTER
}
