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

#ifdef HIDE_DEAD_IN_SQUAD
DEBUG_PRINT_LOG("[RESPAWN] Checking if dead unit is leader of group");
// If the dead player is the leader, give leadership to the least recently respawned player in the group
private _alivePlayersInGroup = (units _oldGroup) select {alive _x};
if ((_oldUnit isEqualTo (leader _oldGroup))) then {
	if ((count _alivePlayersInGroup > 0)) then {
		private _leastRecentTime = CBA_missionTime;
		private _leastRecentPlayer = player;

		// Find the least recently respawned player amongst the alive group members
		{
			private _respawnTime = _x getVariable ["f_var_playerLastRespawnTime", CBA_missionTime];
			if (_respawnTime <= _leastRecentTime) then {
				_leastRecentTime = _respawnTime;
				_leastRecentPlayer = _x;
			};
		} forEach _alivePlayersInGroup;

		DEBUG_FORMAT2_LOG("[RESPAWN] Setting group leader to least recently respawned player %1 with respawn time %2", _leastRecentPlayer, _leastRecentTime);
		_oldGroup selectLeader _leastRecentPlayer;
	};
};

#endif

// load bearing nil :)
nil;