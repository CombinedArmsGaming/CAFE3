params [["_group", grpNull], ["_vehicle", objNull], ["_logic", objNull]];

if (isNil "lambs_wp_fnc_taskGarrison") exitWith
{
	diag_log "[Trigger Spawner] Cannot apply LAMBS order 'Task Garrison': LAMBS is missing.";
};

private _configMap = _logic getVariable "f_map_triggerSpawner";

if (isNil "_configMap") exitWith
{
	diag_log format ["[Trigger Spawner] Tried to spawn a node with missing configuration: '%1'", _logic];
};

private _posObj = nearestBuilding getPos _logic;
private _teleport = _configMap getOrDefault ["teleport", false];
private _sortBasedOnHeight = _configMap getOrDefault ["sortBasedOnHeight", false];
private _exitCondition = _configMap getOrDefault ["exitCondition", -2]; // (-2 Random, -1 All, 0 None, 1 Hit, 2 Fired, 3 FiredNear, 4 Suppressed)
private _patrol = _configMap getOrDefault ["patrol", false];

[
    _group,
    _posObj,
    10,
    [],
    _teleport,
    _sortBasedOnHeight,
    _exitCondition,
    _patrol
] call lambs_wp_fnc_taskGarrison;