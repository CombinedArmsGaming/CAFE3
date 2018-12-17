// F3 - Near Player Group Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

#include "macros.hpp"

params ["_unit", "_distance"];

_playerGroups = missionNamespace getVariable ["f_arr_playerGroups", []];
if (_playerGroups isEqualTo []) exitWith { false };

_closeEnough = false;

scopeName "sqfSucks";

{
    _group = _x;
    _leader = leader _group;

    _distance2D = _leader distance2D _unit;

    if (_distance2D < _distance) then
    {
        _closeEnough = true;
        breakTo "sqfSucks";
    };

} forEach _playerGroups;


_closeEnough
