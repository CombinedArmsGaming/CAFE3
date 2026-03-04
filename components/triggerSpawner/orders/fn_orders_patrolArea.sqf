params [["_group", grpNull], ["_vehicle", objNull], ["_logic", objNull]];

if (isNil "lambs_wp_fnc_taskPatrol") exitWith
{
	diag_log "[Trigger Spawner] Cannot apply LAMBS order 'Task Patrol': LAMBS is missing.";
};

private _configMap = _logic getVariable "f_map_triggerSpawner";

if (isNil "_configMap") exitWith
{
	diag_log format ["[Trigger Spawner] Tried to spawn a node with missing configuration: '%1'", _logic];
};

private _pos = getPos _logic;
private _radius = _configMap getOrDefault ["radius", 100];
private _waypointCount = _configMap getOrDefault ["waypointCount", 4];
private _moveWaypoints = _configMap getOrDefault ["moveWaypoints", false];
private _enableReinforcement = _configMap getOrDefault ["enableReinforcement", false];
private _teleport = _configMap getOrDefault ["teleport", false];

[
    _group,
    _pos,
    _radius,
    _waypointCount,
    [],
    _moveWaypoints,
    _enableReinforcement,
    _teleport
] call lambs_wp_fnc_taskPatrol;