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
	setPlayerRespawnTime INITIAL_RESPAWN_DELAY;
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


// Wait until respawn-map or respawn-spectator screen is visible, then force on auto-respawn.
[
	{		
		(missionNamespace getVariable ["BIS_RscRespawnControlsMap_shown", false]) or {missionNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]}
	},
	{
		DEBUG_PRINT_CHAT("[TriggeredWaves]: Turning on auto-respawn")
		uiNamespace setVariable ["BIS_RscRespawnControls_autorespawn", true];
	},
	[],

	// Set a timeout of 10s just in case we're in an odd configuration where the respawn menu isn't being used.
	10,
	{
		DEBUG_PRINT_CHAT("[TriggeredWaves]: Auto-respawn setter timed out.")
	}
	
] call CBA_fnc_waitUntilAndExecute;