draw_set_color(c_white);
//If I'm up front, or C is being held, display my health.
if (global.front_enemy_1 == self || global.front_enemy_2 == self || keyboard_check(ord("C"))) && !instance_exists(objDeath)
{
	switch armor
	{
		//If I have 1 armor, it's the ArmorHeart series.
		case 1: if vulnerable <= 0 {draw_sprite(sprArmorHeart,0,x-75,y-165);}
		else {draw_sprite(sprArmorHeartVuln,0,x-75,y-165);}
		break;
		//If I have 2 armor, it's the QueenHeart series.
		case 2: if vulnerable <= 0 {draw_sprite(sprQueenHeart,0,x-75,y-165);}
		else {draw_sprite(sprQueenHeartVuln,0,x-75,y-165);}
		break;
		//If I have no armor, just draw the Heart series.
		default: if vulnerable <= 0{draw_sprite(sprHeart,0,x-75,y-165);}
		else{draw_sprite(sprHeartVuln,0,x-75,y-165);}
		break;
	}
	draw_text(x-75,y-165,string(current_hp));
}
if keyboard_check(ord("C")) && !instance_exists(objDeath)
{
	draw_sprite(sprThreat,0,x-40,y-165);
	draw_text(x-40,y-165,string(damage));
}