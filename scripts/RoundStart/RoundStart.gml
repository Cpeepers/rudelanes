//Checks if you're in endless mode. If you are, and have sufficiently depleted the pool, generates a 'block' of enemies.
if global.endless = true && ds_list_size(enemy_pool) < 8
{
	var refill_pool = choose(0,1,2,3);
	switch refill_pool
	{
		//The first block is a bunch of birds. Lucky!
		case 0: ds_list_add(enemy_pool,objCrow,objRaven)
		for (var i = 0; i < 6; i++){ds_list_add(enemy_pool,choose(objCrow,objCrow,objCrow,objRaven,objRaven,objRaven,objVampire));}
		break;
		//The second block is a bunch of rabbits.
		case 1: ds_list_add(enemy_pool,objRabbit,objQueen)
		for (var i = 0; i < 6; i++){ds_list_add(enemy_pool,choose(objRabbit,objRabbit,objRabbit,objQueen,objQueen));}
		var mime_time = irandom_range(1,100)
		if mime_time <= pirou_chance {pirou_chance = 15; ds_list_add(enemy_pool,objPirouette);} else {pirou_chance += 20;}
		break;
		//The third block is vampires with supporting units.
		case 2: ds_list_add(enemy_pool,objSkeleton,objVampire)
		for (var i = 0; i < 6; i++){ds_list_add(enemy_pool,choose(objRaven,objRaven,objSkeleton,objSkeleton,objVampire,objVampire,objActualDemon));}
		var mime_time = irandom_range(1,100)
		if mime_time <= pirou_chance {pirou_chance = 15; ds_list_add(enemy_pool,objPirouette);} else {pirou_chance += 20;}
		break;
		//The fourth is a blatant, obvious attempt to annihilate the player.
		case 3: ds_list_add(enemy_pool,objPirouette)
		for (var i = 0; i < 6; i++){ds_list_add(enemy_pool,choose(objCandy,objCandy,objCandy,objSkeleton,objActualDemon));}
		var mime_time = irandom_range(1,100)
		if mime_time <= pirou_chance {pirou_chance = 15; ds_list_add(enemy_pool,objPirouette);} else {pirou_chance += 20;}
		break;
	}
}
//The characters' actions are reset, and round-start specific abilities are activated.
with global.first_character{alarm[0] = 1}
with global.second_character{alarm[0] = 1}
//Intent objects are created.
instance_create_layer(170,LANE_1,"Statuses",objIntent1)
instance_create_layer(180,LANE_2,"Statuses",objIntent2)
//The first character is highlighted
chosen_character = global.first_character;