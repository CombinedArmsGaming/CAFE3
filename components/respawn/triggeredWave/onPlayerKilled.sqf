#include "macros.hpp"

params [["_newUnit", objNull, [objNull]], "_oldUnit", "_respawn", "_respawnDelay"];

if (!isPlayer _newUnit && !isNull _newUnit) exitWith 
{
	["Attempting to use 'CAFE_TriggeredWave' on AI unit '%1' - can be used only on players.", _newUnit] call BIS_fnc_error; 
};

setPlayerRespawnTime 1e10;

// Wait until wave is triggered or player is alive.  Re-enable respawn for local player in either case.
[
	// Condition
	{
		(alive player) or {([player] call f_fnc_getRespawnTimestampForTarget) >= CBA_missionTime}
	},

	// Script
	{
		setPlayerRespawnTime 1;
	}

] call CBA_fnc_waitUntilAndExecute;