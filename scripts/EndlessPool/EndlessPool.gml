//Being more difficult than the story mode, it has a greater chance of throwing in a mid-game threat early.
//Of course, it still makes sure that 
ds_list_add(enemy_pool,choose(objCrow,objRabbit,objCandy));
for (var i = 0; i < 2; i++){ds_list_add(enemy_pool,choose(objCrow,objCrow,objCrow,objRabbit,objRabbit,objRaven,objCandy,objSkeleton));}
ds_list_add(enemy_pool,choose(objCrow,objRabbit,objCandy));
for (var i = 0; i < 4; i++){ds_list_add(enemy_pool,choose(objCrow,objCrow,objCrow,objCrow,objRabbit,objRabbit,objRaven,objRaven,objCandy));}
//Then it enters the mid-game, throwing generally-stronger enemies at them.
for (var i = 0; i < 6; i++){ds_list_add(enemy_pool,choose(objCandy,objCandy,objSkeleton,objSkeleton,objVampire));}
//After that, it just lets the RoundStart script fill the pool with blocks of enemies.