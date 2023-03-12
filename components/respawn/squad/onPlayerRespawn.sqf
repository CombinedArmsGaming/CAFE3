#include "macros.hpp"

/*
	CAFE Squad on-respawn script.

	Make sure the player sees the squad dialog so they can rejoin their squad and use their teleport token if a JIP.
*/

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// Players shouldn't see the dialog on first spawn, unless they JIPped in.
private _didFirstSpawn = missionNamespace getVariable ["f_var_squad_didFirstSpawn", false];
missionNamespace setVariable ["f_var_squad_didFirstSpawn", true];

if (didJip or ((!didJip) and _didFirstSpawn)) exitWith 
{
	#ifdef ALLOW_TELEPORT_UPON_RESPAWN

	player setVariable ["f_var_mayTeleportToGroup", true, true];

	#endif

	f_var_groupPicker_disableCancel = true;
	createDialog "CAFE_GroupPicker_Dialog";
};