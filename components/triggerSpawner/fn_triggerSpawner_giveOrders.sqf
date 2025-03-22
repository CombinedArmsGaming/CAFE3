params [["_logic", objNull], ["_group", grpNull], ["_vehicle", objNull]];

// Ensure params are valid - fail smoothly.
if ((isNull _group) || (isNull _logic)) exitWith
{
    diag_log format ["[Trigger Spawner] Failed to give orders: Node '%1', Group '%2', Vehicle '%3', ", _logic, _group, _vehicle];
};

private _configMap = _logic getVariable "f_map_triggerSpawner";

if (isNil "_configMap") exitWith
{
	diag_log format ["[Trigger Spawner] Spawned units from a node with missing configuration: '%1'.", _logic];
};

private _orders = _configMap get "type";

private _ordersFunc = switch (toLower _orders) do 
{
    case "no orders": { f_fnc_orders_noOrders };
    case "garrison area": { f_fnc_orders_garrisonArea };
    case "garrison building": { f_fnc_orders_garrisonBuilding };
    case "patrol area": { f_fnc_orders_patrolArea };
    case "hunt": { f_fnc_orders_taskHunt };
    case "rush": { f_fnc_orders_taskRush };
    default { f_fnc_orders_noOrders };
};

[_group, _vehicle, _logic] call _ordersFunc;