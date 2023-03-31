#include "macros.hpp"

// ACRE integration for CAFE, by Bubbus

params ["_typeOfUnit", "_unit", "_faction", "_loadout", "_extendedArray"];

private _group = group _unit;

private _radiosForUnit = [side _group, _typeOfUnit, groupId _group] call f_fnc_acre_getRadiosForRoleInGroup;

diag_log format ["[GETRDO1] %1", _radiosForUnit];

private _groupRadioOverrides = [_group, _radiosForUnit] call f_fnc_acre_getGroupRadioOverrides;

diag_log format ["[GETRDO2] %1", _groupRadioOverrides];

_groupRadioOverrides