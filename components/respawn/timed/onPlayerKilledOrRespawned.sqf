#include "macros.hpp"

params [["_newUnit", objNull, [objNull]], "_oldUnit", "_respawn", "_respawnDelay"];

if (!isPlayer _newUnit && !isNull _newUnit) exitWith 
{
	["Attempting to use 'CAFE_Timed' on AI unit '%1' - can be used only on players.", _newUnit] call BIS_fnc_error; 
};

_respawnDelay = [_newUnit, _respawnDelay] call f_fnc_getPlayerRespawnDelay;

setPlayerRespawnTime _respawnDelay;