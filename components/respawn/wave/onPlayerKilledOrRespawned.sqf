#include "macros.hpp"

params [["_newUnit", objNull, [objNull]], "_oldUnit", "_respawn", "_respawnDelay"];

if (!isPlayer _newUnit && !isNull _newUnit) exitWith 
{
	["Attempting to use 'CAFE_Wave' on AI unit '%1' - can be used only on players.", _newUnit] call BIS_fnc_error; 
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

_respawnDelay = [_newUnit, (_respawnDelay max MINIMUM_RESPAWN_DELAY)] call f_fnc_getPlayerRespawnDelay;

if (!alive _newUnit) then 
{
	setPlayerRespawnTime ((_respawnDelay + _respawnDelay - (serverTime % _respawnDelay)) max MINIMUM_RESPAWN_DELAY);
} 
else 
{
	setPlayerRespawnTime _respawnDelay;
};