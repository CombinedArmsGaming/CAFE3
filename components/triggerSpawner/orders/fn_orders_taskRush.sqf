params [["_group", grpNull], ["_vehicle", objNull], ["_logic", objNull]];

if (isNil "lambs_wp_fnc_taskRush") exitWith
{
	diag_log "[Trigger Spawner] Cannot apply LAMBS order 'Task Rush': LAMBS is missing.";
};

private _configMap = _logic getVariable "f_map_triggerSpawner";

if (isNil "_configMap") exitWith
{
	diag_log format ["[Trigger Spawner] Tried to spawn a node with missing configuration: '%1'", _logic];
};

private _pos = getPos _logic;
private _radius = _configMap getOrDefault ["radius", 500];
private _cycle = _configMap getOrDefault ["cycleTime", 70];
private _onlyPlayers = _configMap getOrDefault ["onlyHuntPlayers", true];

[
    _group,
    _radius,
    _cycle,
    [],
    _pos,
    _onlyPlayers
] call lambs_wp_fnc_taskRush;