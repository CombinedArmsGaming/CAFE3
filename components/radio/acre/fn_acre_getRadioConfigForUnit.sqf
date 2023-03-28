#include "macros.hpp"

// ACRE integration for CAFE, by Bubbus

params ["_typeOfUnit", "_unit", "_faction", "_loadout", "_extendedArray"];

private _group = group _unit;

private _radiosForUnit = [side _group, _typeOfUnit, groupId _group] call f_fnc_acre_getRadiosForRoleInGroup;

//private _groupRadioOverrides = [_group] call 