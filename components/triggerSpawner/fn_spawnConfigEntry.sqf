// courtesy of cre8or's work in zeus_ui/fn_compileLists.sqf and ui_spawn.sqf
// im sorry

params ["_categoryName", "_unitName", "_node"];

// Get the config path to the category
private _categoryConfig = missionConfigFile >> "CA_ZeusUI_Units" >> _categoryName;

// Fetch the category's settings
private _categoryName = [_categoryConfig, "categoryName", ""] call BIS_fnc_returnConfigEntry;
private _categoryGear = [_categoryConfig, "gear", ""] call BIS_fnc_returnConfigEntry;
private _categorySide = [_categoryConfig, "side", ""] call BIS_fnc_returnConfigEntry;

// Determine the side based on the string
switch (toLower _categorySide) do {
	case "west": {_categorySide = west};
	case "east": {_categorySide = east};
	case "resistance": {_categorySide = resistance};
	case "civilian": {_categorySide = civilian};
	default {_categorySide = sideUnknown};		// Fallback for incorrect side inputs
};

// Create a namespace for the unit
private _unitConfig = _categoryConfig >> _unitName;

// Fetch the data from this unit entry
private _unitName = [_unitConfig, "unitName", ""] call BIS_fnc_returnConfigEntry;
private _unitVehicle = [_unitConfig, "vehicle", ""] call BIS_fnc_returnConfigEntry;
private _unitRoles = [_unitConfig, "units", []] call BIS_fnc_returnConfigEntry;
private _reinforcementRoles = [_unitConfig, "reinforcements", []] call BIS_fnc_returnConfigEntry;

// Get the orders 'closure' from the spawner node.
private _giveOrders = _node getVariable ["f_fnc_applyOrders", {}];

[
	_unitRoles,
	getPos _node,
	_categoryGear,
	_categorySide,
	_unitVehicle,
	true,
	false,
	false,
	_reinforcementRoles,
	0,
	_giveOrders
] remoteExec ["f_fnc_server_spawnGroup", 2, false];