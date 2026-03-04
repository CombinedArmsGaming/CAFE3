#include "macros.hpp"

/*
 * Author: Poulern
 * Spawns a group that patrols an area
 *
 * Arguments:
 * 0: array of units
 * 1: start position
 * 2: radius of area to patrol eg 200
 * 3: Faction of group used in CAFE.
 * 4: side of group eg west east independent
 *
 * Return Value:
 * Group.
 *
 */

params ["_unitarray","_position",["_radius", 200, [2]],["_faction",""],["_side", f_defaultSide]];

_group = [_unitarray,_position,_faction,_side] call f_fnc_spawnGroup;
_posdir = _position call f_fnc_getDirPos;
_patrolpos = _posdir select 0;

if !(isNil 'lambs_wp_fnc_taskPatrol') then
{
    [_group, _patrolpos, _radius] call lambs_wp_fnc_taskPatrol;
}
else
{
    [_group, _patrolpos, _radius] call CBA_fnc_taskPatrol;
};

_group
