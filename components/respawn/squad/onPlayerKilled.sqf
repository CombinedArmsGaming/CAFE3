#include "macros.hpp"

/*
	CAFE Squad on-killed script.

	If an old unit exists, remove it from its squad and make sure the implicit new squad is hidden.
*/

params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

if (isNull _oldUnit) exitWith
{
	DEBUG_PRINT_CHAT("[RESPAWN-2]: No old unit found.  respawnOnStart may be set to 1.")
};

DEBUG_FORMAT2_CHAT("[RESPAWN-2]: Storing squad %1 for player %2.", (group _oldUnit), (_oldUnit))
private _oldGroup = group _oldUnit;

[_oldGroup] call f_fnc_storePlayerGroup;

// load bearing nil :)
nil;