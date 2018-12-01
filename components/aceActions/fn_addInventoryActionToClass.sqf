#include "macros.hpp"

params ["_unit"];

_type = typeOf _unit;

if (isNil "f_arr_inventoryActionClasses") then {f_arr_inventoryActionClasses = [];};
if (_type in f_arr_inventoryActionClasses) exitWith {};

f_arr_inventoryActionClasses pushBack _type;

_actionCode = { _player action ["Gear", _target]; };
_condition = { !alive (_this select 0) };

_action =
[
    "OpenInventory",
    "Open Inventory",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa",
    _actionCode,
    _condition,
    {},
    [],
    "",
    3,
    [false,false,false,false,false],
    {}

];

_action call ace_interact_menu_fnc_createAction;

[_type, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
