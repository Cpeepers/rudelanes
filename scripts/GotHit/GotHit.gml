//If I've only just been hit on this frame,
if got_hit = false
{
	//And it's the oppropriate time for it,
	if objFightController.state == fight_states.RETALIATE1 && place_meeting(x,y,objIntent1)
	{
		//
		var enemy = ds_list_find_value(global.lane_1,0);
		var damage_taken = ((global.front_enemy_1.damage+global.front_enemy_1.buff-armor)*(vulnerable+1))
		got_hit = true;
		if damage_taken > 0 {current_hp -= damage_taken;}
		//If I was hit by a Skeleton, give me vulnerable.
		if enemy.object_index == objSkeleton || enemy.object_index == objActualDemon {got_stat = true; got_vuln = true; vulnerable = 1;}
		//If I got hit by a vampire, the vampire heals for however much damage I took.
		if enemy.object_index == objVampire{enemy.current_hp += damage_taken}
		//And then destroy Intent1 one second later
		objIntent1.alarm[0] = room_speed;
	}
	if objFightController.state == fight_states.RETALIATE2 && place_meeting(x,y,objIntent2)
	{
		var enemy = ds_list_find_value(global.lane_2,0);
		var damage_taken = ((global.front_enemy_2.damage+global.front_enemy_2.buff-armor)*(vulnerable+1))
		got_hit = true;
		if damage_taken > 0 {current_hp -= damage_taken;}
		//If I was hit by a Skeleton, give me vulnerable.
		if enemy.object_index == objSkeleton || enemy.object_index == objActualDemon{got_stat = true; got_vuln = true; vulnerable = 1;}
		//If I got hit by a vampire, the vampire heals for however much damage I took.
		if enemy.object_index == objVampire{enemy.current_hp += damage_taken}
		//And then destroy Intent2 one second later.
		objIntent2.alarm[0] = room_speed;
	}
}