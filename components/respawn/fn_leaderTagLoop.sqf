#include "macros.hpp"
/*
    Continually runs. 
    Sets f_var_playerLeaderOfGroup to player if:
        - Player is leader of their group and 
        - The person who previously had playerLeaderOfGroup is alive or not in squad
*/

[
    {
        private _shouldTakeTag = true;
        // Use if statement to get short-circuiting/lazy evaluation type behavior
        if (true) then {
            if (!(alive player)) exitWith {_shouldTakeTag = false};

            // Don't care about players who aren't leader
            if (player isNotEqualTo (leader group player)) exitWith {_shouldTakeTag = false};

            // Don't care if we already have the tag
            private _groupLeader = (group player) getVariable ["f_var_playerLeaderOfGroup", ""];
            if (_groupLeader isEqualTo (name player)) exitWith {_shouldTakeTag = false};

            private _groupLeaderArray = (units player) select {_groupLeader isEqualTo (name _x)};
            
            // Player who had the tag has left the squad (e.g. disconnected)
            if (count _groupLeaderArray < 1) exitWith {_shouldTakeTag = true};

            // If there is a player in the squad with the group leader tag
            private _groupLeaderUnit = _groupLeaderArray # 0;
            private _lastRespawnTime = _groupLeaderUnit getVariable ["f_var_playerLastRespawnTime", 0];
            // If the player with the tag is dead, exit. Assume we only took leader temporarily.
            if (!(alive _groupLeaderUnit)) exitWith {_shouldTakeTag = false;};
            // If the player with the tag respawned in the last 3 minutes, they are in the grace period to TP in and keep the tag
            if (_lastRespawnTime + 180 > CBA_missionTime) exitWith {_shouldTakeTag = false;}
        };
        
        if (_shouldTakeTag) then {
            (group player) setVariable ["f_var_playerLeaderOfGroup", name player, true];
            DEBUG_FORMAT2_LOG("[RESPAWN] Player %1 taking leaderOfGroup for group %2", name player, group player);
            DEBUG_PRINT_CHAT("Took leader tag");
        };
        [] call f_fnc_leaderTagLoop;
    },
    [],
    1
] call CBA_fnc_waitAndExecute;