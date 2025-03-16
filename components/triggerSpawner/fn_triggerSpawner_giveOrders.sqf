params [["_group", grpNull], ["_vehicle", objNull], ["_logic", objNull]];

// Ensure params are valid - fail smoothly.
if ((isNull _group) || (isNull _vehicle) || (isNull _logic)) exitWith
{
    diag_log format ["[Trigger Spawner] Failed to give orders: Group '%1', Vehicle '%2', Node '%3'", _group, _vehicle, _logic];
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

_this call _ordersFunc;