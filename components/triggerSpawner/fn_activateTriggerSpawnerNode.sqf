params ["_logic"];

private _configMap = _logic getVariable "f_map_triggerSpawner";

if (isNil "_configMap") exitWith
{
	diag_log format ["[Trigger Spawner] Tried to spawn a node with missing configuration: '%1'", _logic];
};

private _category = _configMap get "category";
private _unit = _configMap get "unit";

[_category, _unit, _logic] call f_fnc_spawnConfigEntry;