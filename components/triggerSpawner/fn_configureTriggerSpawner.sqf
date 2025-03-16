params ["_logic", "_configArray"];

private _configMap = createHashMapFromArray _configArray;

// Throws if config is invalid.  Config is assumed to remain static after validation.
[_logic, _configMap] call f_fnc_validateTriggerSpawnerConfigMap;

_logic setVariable ["f_map_triggerSpawner", _configMap];


// Create a 'closure' containing the desired order and a reference to this node.
// When execution passes to the server or a HC the orders can be applied.

private _toCompile = format ["([%1] + _this) call f_fnc_triggerSpawner_giveOrders;", vehicleVarName _logic];
private _ordersFunc = compile _toCompile;

_logic setVariable ["f_fnc_applyOrders", _ordersFunc];