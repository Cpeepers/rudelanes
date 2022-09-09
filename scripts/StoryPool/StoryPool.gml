//It starts by filling it with a bird-based early game, with a rabbit or Candi thrown in.
//It makes sure that a Raven isn't at the front of either lane
ds_list_add(enemy_pool,choose(objCrow,objCrow,objRabbit));
for (var i = 0; i < 2; i++){ds_list_add(enemy_pool,choose(objCrow,objCrow,objCrow,objCrow,objRabbit,objRabbit,objRaven,objRaven,objCandy));}
ds_list_add(enemy_pool,choose(objCrow,objCrow,objRabbit,objCandy));
for (var i = 0; i < 4; i++){ds_list_add(enemy_pool,choose(objCrow,objCrow,objCrow,objCrow,objRabbit,objRabbit,objRaven,objRaven,objCandy));}
//Then it enters the mid-game, throwing some awkward-to-deal-with threats at you
for (var i = 0; i < 6; i++){ds_list_add(enemy_pool,choose(objCrow,objRaven,objCandy,objCandy,objSkeleton,objSkeleton));}
//Then it makes sure a rabbit will protect her queen, entering into the rabbit-based late game.
//If it's all rabbits and no queen, then a queen is guaranteed to spawn at the end of the wave.
//This is also the first point where Pirouette has a chance to spawn
for (var i = 0; i < 4; i++){ds_list_add(enemy_pool,choose(objRabbit,objRabbit,objRabbit,objRabbit,objQueen));}
if ds_list_find_index(enemy_pool,objQueen) == -1 && ds_list_find_index(enemy_pool,objQueen) == -1 {ds_list_add(enemy_pool,objQueen);}
var mime_time1 = irandom_range(1,100)
if mime_time1 <= pirou_chance {pirou_chance = 15; ds_list_add(enemy_pool,objPirouette);} else {pirou_chance += 20;}
//Then it produces the end-game just before the boss, loaded with buff vampires and spooky skeletons.
//This is also the second point where Pirouette has a chance to spawn
ds_list_add(enemy_pool,objVampire,objRaven);
for (var i = 0; i < 4; i++){ds_list_add(enemy_pool,choose(objRaven,objSkeleton,objVampire,objVampire));}
var mime_time2 = irandom_range(1,100)
if mime_time2 <= pirou_chance {pirou_chance = 15; ds_list_add(enemy_pool,objPirouette);} else {pirou_chance += 20;}
