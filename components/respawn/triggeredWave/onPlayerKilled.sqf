#include "macros.hpp"

params [["_newUnit", objNull, [objNull]], "_oldUnit", "_respawn", "_respawnDelay"];

if (!isPlayer _newUnit && !isNull _newUnit) exitWith 
{
	["Attempting to use 'CAFE_TriggeredWave' on AI unit '%1' - can be used only on players.", _newUnit] call BIS_fnc_error; 
};

if ((isNil 'f_var_respawn_hadFirstSpawn') and 
	{
		f_var_respawn_hadFirstSpawn = true;
		private _isRespawnOnStart = getNumber (missionConfigFile >> "respawnOnStart");
		(_isRespawnOnStart == 1)
	})
exitWith
{
	setPlayerRespawnTime (INITIAL_RESPAWN_DELAY max MINIMUM_RESPAWN_DELAY);
};

setPlayerRespawnTime 1e10;

// Wait until wave is triggered or player is alive.  Re-enable respawn for local player in either case.
[
	// Condition
	{
		(alive player) or 
		{
			(([player] call f_fnc_getRespawnTimestampForTarget) >= CBA_missionTime) and 
			{
				([player, 0, true] call BIS_fnc_respawnTickets) > 0
			}
		}
	},

	// Script
	{
		setPlayerRespawnTime MINIMUM_RESPAWN_DELAY;
	}

] call CBA_fnc_waitUntilAndExecute;