if got_stat
{
	if got_act
	{
		GotStats(argument0,sprGotAct);
		got_act = false;
	}
	if got_pow
	{
		GotStats(argument0,sprGotPow);
		got_pow = false;
	}
	if got_armor
	{
		GotStats(argument0,sprGotArmor);
		got_armor = false;
	}
	if got_vuln
	{
		GotStats(argument0,sprGotVuln);
		got_vuln = false;
	}
	got_stat = false;
}