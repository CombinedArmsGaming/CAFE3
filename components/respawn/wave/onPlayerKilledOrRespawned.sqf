#include "macros.hpp"

params [["_newUnit", objNull, [objNull]], "_oldUnit", "_respawn", "_respawnDelay"];

if (!isPlayer _newUnit && !isNull _newUnit) exitWith 
{
	["Attempting to use 'CAFE_Wave' on AI unit '%1' - can be used only on players.", _newUnit] call BIS_fnc_error; 
};

_respawnDelay = [_newUnit, _respawnDelay] call f_fnc_getPlayerRespawnTime;

if (!alive _newUnit) then 
{
	setPlayerRespawnTime (_respawnDelay + _respawnDelay - (serverTime % _respawnDelay));
} 
else 
{
	setPlayerRespawnTime _respawnDelay;
};