#include "macros.hpp"
params ["_groupName"];

private _group = (groups playerSide) select {groupId _x isEqualTo _groupName};

if (count _group <= 0) exitWith {
    DEBUG_FORMAT3_LOG("[CAFE Respawn]: Could not find group for player. Old name was: %1, Options on side were: %2. Players side is: %3",_groupName,groups playerSide,playerSide)
};

diag_log format ["[CAFE Respawn]: Group in: %1", _groupName];
diag_log format ["[CAFE Respawn]: %1 joinSilent %2", [player], (_group#0)];

[player] joinSilent (_group#0);

private _spawns = (player call bis_fnc_getRespawnPositions) + ((player call bis_fnc_objectSide) call bis_fnc_getRespawnMarkers);