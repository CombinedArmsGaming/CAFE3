class CfgRespawnTemplates
{
	class CAFE_Loadout
	{
		onPlayerRespawn = "components\respawn\loadout\onPlayerRespawn.sqf";
		isCall = 1;
	};

	class CAFE_Squad
	{
		onPlayerKilled = "components\respawn\squad\onPlayerKilled.sqf";
		onPlayerRespawn = "components\respawn\squad\onPlayerRespawn.sqf";
		isCall = 1;
	};
}