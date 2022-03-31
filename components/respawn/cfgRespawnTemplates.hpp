class CfgRespawnTemplates
{
	class CAFE_Loadout
	{
		onPlayerRespawn = "components\respawn\loadout\onPlayerRespawn.sqf";
		isCall = 0;
	};

	class CAFE_Squad
	{
		onPlayerKilled = "components\respawn\squad\onPlayerKilled.sqf";
		onPlayerRespawn = "components\respawn\squad\onPlayerRespawn.sqf";
		isCall = 1;
	};

	class CAFE_RespawnConfig_BLUFOR
	{
		respawnDelay = RESPAWN_DELAY_BLUFOR,
		respawnOnStart = RESPAWN_AT_START_BLUFOR
	};
	
	class CAFE_RespawnConfig_OPFOR
	{
		respawnDelay = RESPAWN_DELAY_OPFOR,
		respawnOnStart = RESPAWN_AT_START_OPFOR
	};
	
	class CAFE_RespawnConfig_INDFOR
	{
		respawnDelay = RESPAWN_DELAY_INDFOR,
		respawnOnStart = RESPAWN_AT_START_INDFOR
	};
	
	class CAFE_RespawnConfig_CIVILIAN
	{
		respawnDelay = RESPAWN_DELAY_CIVILIAN,
		respawnOnStart = RESPAWN_AT_START_CIVILIAN
	};
}
