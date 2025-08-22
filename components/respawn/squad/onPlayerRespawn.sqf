#include "macros.hpp"

/*
	CAFE Squad on-respawn script.

	Make sure the player sees the squad dialog so they can rejoin their squad and use their teleport token if a JIP.
*/

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// Players shouldn't see the dialog on first spawn, unless they JIPped in.
private _didFirstSpawn = missionNamespace getVariable ["f_var_squad_didFirstSpawn", false];
missionNamespace setVariable ["f_var_squad_didFirstSpawn", true];

_newUnit setVariable ["f_var_playerLastRespawnTime", CBA_missionTime, true];

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

#ifdef ALLOW_TELEPORT_UPON_RESPAWN

if (didJip or ((!didJip) and _didFirstSpawn)) then 
{
	player setVariable ["f_var_mayTeleportToGroup", true, true];
	DEBUG_PRINT_LOG("[RESPAWN] Setting mayTeleportToGroup to true");
};

#endif

private _playerGroup = missionNamespace getVariable ["f_var_lastPlayerGroupName", ""];
DEBUG_FORMAT3_LOG("[RESPAWN] Player respawned, didFirstSpawn: %1, wants group %2, is in group %3", _didFirstSpawn, _playerGroup, (groupId group player));

if (_didFirstSpawn and {_playerGroup isNotEqualTo ""}) then 
{
	[
		{
			params ["_playerGroup"];
			if (_playerGroup isNotEqualTo (groupId group player)) then {
				_this call f_fnc_forceJoinGroupByName;

				// Reconfigure radios for new group
				// Joining group may take some time, so wait until player is actually in group
				[
					{
						params ["_group"];       
						(groupId (group player)) isEqualTo _group
					},
					{
						params ["_group"];
						[
							{
								params ["_group"];
								DEBUG_FORMAT2_LOG("[RESPAWN] Configuring radios for player in group %1, ideally in group %2", group player, _group); 
								["", player] call f_fnc_configureUnitRadios;
							},
							[_group],
							1            
						] call CBA_fnc_waitAndExecute;
					},
					[_playerGroup],
					// Timeout (secs)
					10,
					{DEBUG_FORMAT1_LOG("[RESPAWN] Timed out waiting for player to join group. Configuring radios in group %1", group player); ["", player] call f_fnc_configureUnitRadios;}
				] call CBA_fnc_waitUntilAndExecute;
			} else {
				DEBUG_FORMAT3_LOG("[RESPAWN] Did not join player to group %1. Player had group %2. Is not equal: %3", _playerGroup, (groupId group player), _playerGroup isNotEqualTo (groupId group player));
			};
			
			[
				{
					#ifdef ALLOW_TELEPORT_UPON_RESPAWN
					DEBUG_PRINT_LOG("[RESPAWN] Checking for teleport after respawn")
					_playerWishesTeleport = missionNamespace getVariable ["f_var_playerWishesTeleportAfterRespawn", false];
					_playerMayTeleport = player getVariable ["f_var_mayTeleportToGroup", false];

					// Reset for next time the player dies
					missionNamespace setVariable ["f_var_playerWishesTeleportAfterRespawn", false];

					private _group = group player;

					// Checking _playerMayTeleport prevents any weirdness happening if e.g. they teleport on their own in <5 seconds
					if (_playerMayTeleport and _playerWishesTeleport and ((leader _group) isNotEqualTo player)) then {
						DEBUG_FORMAT1_LOG("[RESPAWN] Attempting teleport to %1", leader _group);
						[leader _group] spawn f_fnc_tryTeleport;
					} else {
						DEBUG_PRINT_LOG("[RESPAWN] Decided not to teleport player.");
						DEBUG_FORMAT3_LOG("[RESPAWN] Did not teleport player. mayTeleport: %1, wishesTeleport: %2, not leader: %3", _playerMayTeleport, _playerWishesTeleport,((leader _group) isNotEqualTo player));
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


// Load-bearing nil - Arma throws a "GIAS stack error" if this isn't here.
nil