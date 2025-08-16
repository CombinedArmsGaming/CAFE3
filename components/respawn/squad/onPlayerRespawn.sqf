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

[] call f_fnc_respawn_squad_enforceLoadoutGracePeriod;

private _playerGroup = missionNamespace getVariable ["f_var_lastPlayerGroupName", ""];
DEBUG_FORMAT2_LOG("[RESPAWN] Player respawned, didFirstSpawn: %1, wants group %2", _didFirstSpawn, _playerGroup);

if (_didFirstSpawn and {_playerGroup isNotEqualTo ""}) then 
{
	[
		{
			if (_playerGroup isNotEqualTo (groupId group player)) then {
				_this call f_fnc_forceJoinGroupByName;
			};
			
			[
				{
					#ifdef ALLOW_TELEPORT_UPON_RESPAWN
					DEBUG_PRINT_LOG("[RESPAWN] Checking for teleport after respawn")
					_playerWishesTeleport = missionNamespace getVariable ["f_var_playerWishesTeleportAfterRespawn", false];

					// Reset for next time the player dies
					missionNamespace setVariable ["f_var_playerWishesTeleportAfterRespawn", false];

					private _group = group player;

					// Checking if may teleport to group prevents any weirdness happening if e.g. they teleport on their own in <5 seconds
					if (player getVariable ["f_var_mayTeleportToGroup", false] and _playerWishesTeleport and ((leader _group) isNotEqualTo player)) then {
						DEBUG_FORMAT1_LOG("[RESPAWN] Attempting teleport to %1", leader _group);
						[leader _group] spawn f_fnc_tryTeleport;
					} else {
						DEBUG_FORMAT3_LOG("[RESPAWN] Did not teleport player. mayTeleport: %1, wishesTeleport: %2, not leader: %3", player getVariable ["f_var_mayTeleportToGroup", false], _playerWishesTeleport,((leader _group) isNotEqualTo player));
					};
					#endif
				},
				[player],
				1
			] call CBA_fnc_waitAndExecute;
		},
		[_playerGroup],
		1
	] call CBA_fnc_waitAndExecute;
};


#ifdef ALLOW_TELEPORT_UPON_RESPAWN

if (didJip or ((!didJip) and _didFirstSpawn)) exitWith 
{
	player setVariable ["f_var_mayTeleportToGroup", true, true];
};

#endif


// Load-bearing nil - Arma throws a "GIAS stack error" if this isn't here.
nil