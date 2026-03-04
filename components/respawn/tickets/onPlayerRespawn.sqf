#include "macros.hpp"

/*
	CAFE Tickets on-respawn script.

	Remove a ticket from the most-local non-zero ticket pool to the player.
*/

params [["_newUnit", objNull, [objNull]], "_oldUnit", "_respawn", "_respawnDelay"];

if (!isPlayer _newUnit && !isNull _newUnit) exitWith 
{
	["Attempting to use 'CAFE_Tickets' on AI unit '%1' - can be used only on players.", _newUnit] call BIS_fnc_error; 
};

if (isNil 'f_var_respawn_tickets_hadFirstSpawn') exitWith
{
	DEBUG_FORMAT1_LOG("[RESPAWN-2] %1 spawning for the first time - not removing a ticket.", _newUnit)
	f_var_respawn_tickets_hadFirstSpawn = true;
};

DEBUG_FORMAT1_LOG("[RESPAWN-2] %1 spawning - removing a ticket.", _newUnit)
[_newUnit, -1, true] call bis_fnc_respawnTickets;