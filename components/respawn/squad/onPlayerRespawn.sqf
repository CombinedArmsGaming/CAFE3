#include "macros.hpp"

/*
	CAFE Squad on-respawn script.

	Make sure the player sees the squad dialog so they can rejoin their squad and use their teleport token if a JIP.
*/

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// Players shouldn't see the dialog on first spawn, unless they JIPped in.
private _didFirstSpawn = missionNamespace getVariable ["f_var_squad_didFirstSpawn", false];
missionNamespace setVariable ["f_var_squad_didFirstSpawn", true];

// If not JIP or first spawn, need to reapply gearscript after group is selected.  Apply a grace period of 60s in case group assignment goes wrong.
f_fnc_respawn_squad_enforceLoadoutGracePeriod = 
{
	params [["_timeUntil", time+60]];

	if (time > _timeUntil) exitWith
	{
		f_var_groupPicker_forceGearscript = nil;
	};
	
	f_var_groupPicker_forceGearscript = true;

	[
		{
			_this call f_fnc_respawn_squad_enforceLoadoutGracePeriod;
		},
		[_timeUntil],
		1
	] call CBA_fnc_waitAndExecute;
};

if (didJip or ((!didJip) and _didFirstSpawn)) exitWith 
{
	#ifdef ALLOW_TELEPORT_UPON_RESPAWN

	player setVariable ["f_var_mayTeleportToGroup", true, true];

	#endif

	[] call f_fnc_respawn_squad_enforceLoadoutGracePeriod;

	f_var_groupPicker_disableCancel = true;

	// Wait a second to show the dialog, because timing issues can sometimes cause it to show up in the spectator screen, and then be subsequently destroyed.
	[
		{
			createDialog "CAFE_GroupPicker_Dialog";
		},
		[],
		1
	] call CBA_fnc_waitAndExecute;
	
};