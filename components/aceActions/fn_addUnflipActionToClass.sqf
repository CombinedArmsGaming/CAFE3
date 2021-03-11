#include "macros.hpp"

params ["_unit"];

_type = typeOf _unit;

if (isNil "f_arr_unflipActionClasses") then {f_arr_unflipActionClasses = [];};
if (_type in f_arr_unflipActionClasses) exitWith {};

f_arr_unflipActionClasses pushBack _type;

_vehicleMass = getMass _unit;

_actionCode = if (_vehicleMass > 11000) then
{
    { hint "This vehicle is too heavy to un-flip." };
}
else
{
    { [((getMass _target) * 0.005) max 4, _target, { (_this select 0) remoteExec ["f_fnc_unflipVehicle", (_this select 0)]; }, {}, "Un-flipping vehicle..."] call ace_common_fnc_progressBar; }
};

_condition =
{
    _vehicle = (_this select 0);
    _vecUp = vectorUp _vehicle;
    _groundVec = surfaceNormal position _vehicle;

    (_vecUp vectorDotProduct _groundVec) < 0.5
    
};


_action =
[
    "UnflipVehicle",
    "Unflip Vehicle",
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
