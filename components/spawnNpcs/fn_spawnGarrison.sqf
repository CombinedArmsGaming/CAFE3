#include "macros.hpp"

/*
 * Author: Poulern + Bubbus
 * Spawns a group that garrisons buildings in an area
 *
 * Arguments:
 * 0: array of units
 * 1: start position
 * 2: radius of area to garrison eg 200
 * 3: Faction of group used in CAFE.
 * 4: side of group eg west east independent
 *
 * Return Value:
 * Group.
 *
 */

params ["_unitarray","_position",["_radius", 50, [2]],["_faction",""],["_side", f_defaultSide]];

_group = [_unitarray,_position,_faction,_side] call f_fnc_spawnGroup;
_posdir = _position call f_fnc_getDirPos;
_garrisonPos = _posdir select 0;

if !(isNil 'lambs_wp_fnc_taskGarrison') then
{
    [_group, _garrisonPos, _radius] call lambs_wp_fnc_taskGarrison;
}
else
{
    _waypoint = _group addWaypoint [_garrisonPos, 0];
    _waypoint setWaypointScript "\x\cba\addons\ai\fnc_waypointGarrison.sqf []";
};

_group
