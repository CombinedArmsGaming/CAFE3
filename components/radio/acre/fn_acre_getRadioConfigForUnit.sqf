#include "macros.hpp"

// ACRE integration for CAFE, by Bubbus

params ["_unit", ["_typeOfUnit", ""]];

private _group = group _unit;

if (_typeOfUnit isEqualTo "") then
{
    _typeOfUnit = _unit getVariable ["f_var_assignGear", ""];
};

private _radiosForUnit = [side _group, _typeOfUnit, groupId _group] call f_fnc_acre_getRadiosForRoleInGroup;

private _groupRadioOverrides = [_group, _radiosForUnit] call f_fnc_acre_getGroupRadioOverrides;

_groupRadioOverrides