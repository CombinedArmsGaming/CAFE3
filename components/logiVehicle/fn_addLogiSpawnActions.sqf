/*
	Script to create logi action on an object which allows to spawn in new vehicles.

	Author: Bubbus and Joecuronium

	Passable arguments:
	0: object to create action on
	1: logi type - as defined in the logi configuration.

*/

#include "macros.hpp"

params ["_vehicle", "_logiType"];


// Create individual spawn actions

private _vehiclesArray = GET_VEHICLES_DYNAMIC(_logiType);

_actions = [];

{
	private _newAction = [_logiType, _forEachIndex, _vehicle] call f_fnc_createLogiSpawnAction;
	_actions pushBack _newAction;

} forEach _vehiclesArray;

_vehicle setVariable [LOGIVIC_VAR_DYNAMIC("var","clientActions"), _actions];


// Create root logi actions node

private _condition =
{
	params ["_target", "_player", "_params"];

	([_player, _target] call f_fnc_canPlayerUseLogi)
};


private _insertChildren =
{
    params ["_target", "_player", "_params"];

	private _clientActions = _target getVariable [LOGIVIC_VAR_DYNAMIC("var","clientActions"), []];
    private _children = _clientActions apply {[_x, [], _target]};

    _children

};


private _action =
[
    "CA_LogiRoot",
    "Logistics",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\truck_ca.paa",
    {},
    _condition,
    _insertChildren,
    [],
    "",
    20,
    [false,false,false,false,false],
    {}
];

_action call ace_interact_menu_fnc_createAction;


[_vehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
