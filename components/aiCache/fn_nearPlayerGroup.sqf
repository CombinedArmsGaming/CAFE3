// F3 - Near Player Group Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

#include "macros.hpp"

params ["_unit", "_distance"];

_playerGroups = missionNamespace getVariable ["f_arr_aiCaching_playerGroups", []];
if (_playerGroups isEqualTo []) exitWith { false };

_closeEnough = false;

{
    _leader = leader _x;
    _distance2D = _leader distance2D _unit;

    if (_distance2D < _distance) exitWith
    {
        _closeEnough = true;
    };

} forEach _playerGroups;

if (_closeEnough) exitWith {true};


_awayPlayers = missionNamespace getVariable ["f_arr_aiCaching_awayPlayers", []];
if (_awayPlayers isEqualTo []) exitWith { false };

{
    _player = _x;
    _distance2D = _player distance2D _unit;

    if (_distance2D < _distance) exitWith
    {
        _closeEnough = true;
    };

} forEach _awayPlayers;


_closeEnough
