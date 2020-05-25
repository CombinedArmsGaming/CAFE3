#include "macros.hpp"

params ["_group", "_markersArray", "_unitType", "_displayName"];

// Getting custom entry for squad if exists.  Exit early if squad is forced invisible on map.
_name = groupId _group;
_visible = SQUAD_VISIBLE(_group);

if !(_visible) exitWith {};


// Find all eligible units (marker type == gearscript type)
_units = [];

{
    _class = _x getVariable ["f_var_assignGear", ""];

    if (_class isEqualTo _unitType) then
    {
        _units pushBack _x;
    };

} forEach (units _group);


// Try to match marker colour with squad colour, also marker name.
_colour = WHITE;

if (_visible) then
{
    if !(SQUAD_COLOUR(_group) isEqualTo []) then {_colour = SQUAD_COLOUR(_group)};
};

_name = format ["%1 %2", _name, _displayName];


// Generate markers, store in passed-in array.
{
    _markersArray pushBack [_group, _x, _name, _colour];

} forEach _units;
