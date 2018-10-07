// F3 - Near Player Group Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

#include "macros.hpp"

params ["_unit", "_distance"];

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

} forEach f_arr_playerGroups;


_closeEnough
