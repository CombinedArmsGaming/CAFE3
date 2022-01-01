#include "macros.hpp"

/*
 * Author: Poulern
 * Spawns a vehicle that patrols an area in a radius from spawnpoint.
 *
 * Arguments:
 * 0: CAFE group array
 * 1: Spawn position, marker, object, group, location, array
 * 2: Vehicle classname
 * 2: radius of area to patrol eg 200
 * 3: Faction of group used in CAFE Assigngear.
 * 4: Side of units spawned, west east independent
 *
 * Return Value:
 * Array of [group,vehicle]
 *
 */

params ["_unitarray","_position","_vehicletype",["_radius", 200, [2]],["_faction",""],["_side", f_defaultSide]];

_grpvehicle = [_unitarray,_position,_vehicletype,_faction,_side] call f_fnc_spawnVehicleGroup;
_group = _grpvehicle select 0;
_posdir = _position call f_fnc_getDirPos;
_patrolpos = _posdir select 0;

[_group,_patrolpos,_radius] spawn
{
    params ["_group","_patrolpos","_radius"];
    sleep 5;

    _prevPos = _patrolpos;

    _arr = [];
    _arr resize (5 + (floor (random 10)));

    private ["_wp", "_newPos"];

    _wp = [];

    {
        _newPos = _patrolpos getPos [(random _radius),(random 360)];
        _prevPos = _newPos;

        _wp = _group addWaypoint [_newPos, 0];
        _wp setWaypointType "MOVE";
        _wp setWaypointCompletionRadius 20;

    } forEach _arr;

    sleep 5;

    _wp2 = _group addWaypoint [_patrolpos,0];
    _wp2 setWaypointType "CYCLE";
    _wp2 setWaypointCompletionRadius 100;

    [_group,0] setWPPos _patrolpos;

    _wayp0 = currentWaypoint _group;

    sleep 30;

    _wayp1 = currentWaypoint _group;

    if (_wayp1 == _wayp0) then
    {
        _wayp = [_group,(currentWaypoint _group)];
        _wayp setWPPos (getpos (leader _group));

    };

};

_grpvehicle
