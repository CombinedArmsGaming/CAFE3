params ["_groupName"];

private _group = allGroups select {groupId _x isEqualTo _groupName};

if (count _group <= 0) exitWith {};

diag_log format ["[CAFE Respawn]: Group in: %1", _groupName];
diag_log format ["[CAFE Respawn]: %1 joinSilent %2", [player], (_group#0)];

[player] joinSilent (_group#0);