#include "macros.hpp"
/*
    For use with teleporting to group. 
    Expected param is a unit
*/
params ["_goto"];

_onTeleportFailure =
{
    hint "Failed to teleport to group leader.  You can now try again.";
    player setVariable ["f_var_mayTeleportToGroup", true, true];
};

player setVariable ["f_var_mayTeleportToGroup", false, true];

// If the target is dead or is the same player, go to the least recently respawned player in the group
if ((!alive _goto) or (player isEqualTo _goto)) then {
    private _alivePlayersInGroup = (units _goto) select {(alive _x) and (_x isNotEqualTo player)};

    if (count _alivePlayersInGroup > 0) then {
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
        _goto = _leastRecentPlayer;

        DEBUG_FORMAT1_LOG("[TryTeleport] Initial target was same player or is dead. New target: %1", _goto);
    };
    if (count _alivePlayersInGroup <= 0) exitWith {[] call _onTeleportFailure;};
};

#ifdef HIDE_DEAD_IN_SQUAD
if ((name player) isEqualTo ((group player) getVariable ["f_var_playerLeaderOfGroup", ""])) then {
    DEBUG_FORMAT2_LOG("[TryTeleport] Player %1 was leader of group %2, setting leader again", player, group _goto);
    // selectLeader has to be run on the machine where the group is local
    [(group _goto), player] remoteExec ["selectLeader", leader (group _goto)];
};
#endif

_teleHandle = [player, _goto, _onTeleportFailure] spawn f_fnc_teleportPlayer;

waitUntil { sleep 0.1; scriptDone _teleHandle };