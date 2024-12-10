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

DEBUG_FORMAT2_CHAT("[RESPAWN-2]: Removing %1 from squad %2.", _oldUnit, (group _oldUnit))
private _oldGroup = group _oldUnit;

[_oldGroup] call f_fnc_storePlayerGroup;
[_oldUnit] joinSilent grpNull;

// Wait until unit has properly joined new 'respawn' group and then make it invisible on the map.
[
	// Condition
	{
		(group (_this#0)) isNotEqualTo (_this#1)
	},

	// Script
	{
		private _newGroup = group (_this#0);

		if (count units _newGroup <= 1) then
		{
			SET_SQUAD_VISIBILITY_DIRECT(_newGroup,false);
		};
	}, 

	// Arguments
	[_oldUnit, _oldGroup]

] call CBA_fnc_waitUntilAndExecute;