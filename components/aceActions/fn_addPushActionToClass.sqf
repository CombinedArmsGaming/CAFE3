#include "macros.hpp"

params ["_unit"];

_type = typeOf _unit;

if (isNil "f_arr_pushActionClasses") then {f_arr_pushActionClasses = [];};
if (_type in f_arr_pushActionClasses) exitWith {};

f_arr_pushActionClasses pushBack _type;


_actionCode = { [_target, _player] call f_fnc_playerPushVehicle; };

_condition =
{
    _vehicle = (_this select 0);
    _player = (_this select 1);

    _occupants = crew _vehicle;
    _enemyOccupantIndex = _occupants findIf {[(side _player), (side _x)] call BIS_fnc_sideIsEnemy};

    (_enemyOccupantIndex == -1)

};

_action =
[
    "PushVehicle",
    "Push Vehicle",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\truck_ca.paa",
    _actionCode,
    _condition,
    {},
    [],
    "",
    20,
    [false,false,false,false,false],
    {}

];

_action call ace_interact_menu_fnc_createAction;

[_type, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
