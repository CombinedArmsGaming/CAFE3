#include "macros.hpp"

params [["_newUnit", objNull, [objNull]], "_oldUnit", "_respawn", "_respawnDelay"];

if (!isPlayer _newUnit && !isNull _newUnit) exitWith 
{
	["Attempting to use 'CAFE_FixPlayerTickets' on AI unit '%1' - can be used only on players.", _newUnit] call BIS_fnc_error; 
};

private _playerTickets = _newUnit getvariable "BIS_fnc_respawnTickets_value";

if ((!isNil "_playerTickets") and {_playerTickets isEqualTo 0}) then
{
	_newUnit setVariable ["BIS_fnc_respawnTickets_value", nil];
};