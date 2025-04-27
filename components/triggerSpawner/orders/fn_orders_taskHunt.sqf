params [["_group", grpNull], ["_vehicle", objNull], ["_logic", objNull]];

if (isNil "lambs_wp_fnc_taskHunt") exitWith
{
	diag_log "[Trigger Spawner] Cannot apply LAMBS order 'Task Hunt': LAMBS is missing.";
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
private _enableReinforcement = _configMap getOrDefault ["enableReinforcement", false];
private _doUGL = _configMap getOrDefault ["flares", 1]; // 0 Disabled, 1 Always, 2 Only if units actually have UGL flares.

[
    _group,
    _radius,
    _cycle,
    [],
    _pos,
    _onlyPlayers,
    _enableReinforcement,
    _doUGL
] call lambs_wp_fnc_taskHunt;