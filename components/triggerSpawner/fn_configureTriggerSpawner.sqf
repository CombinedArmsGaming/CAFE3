params ["_logic", "_configArray"];

private _configMap = createHashMapFromArray _configArray;

[_logic, _configMap] call f_fnc_validateTriggerSpawnerConfigMap;

_logic setVariable ["f_map_triggerSpawner", _configMap];
