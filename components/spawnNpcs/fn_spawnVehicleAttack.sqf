#include "macros.hpp"

/*
 * Author: Poulern
 * Spawns a vehicle that attacks a location or area.
 *
 * Arguments:
 * 0: F3 group array
 * 1: Spawn position, marker, object, group, location, array
 * 2: Marker, position or location to attack. If marker is type of area, then it will use that instead.
 * 3: Vehicle classname
 * 4: Faction of group used in F3 Assigngear.
 * 5: Side of units spawned, west east independent
 *
 * Return Value:
 * Array of [group,vehicle]
 *
 */

params ["_unitarray","_position","_attackposition","_vehicletype",["_faction",""],["_side", f_defaultSide]];

_grpvehicle = [_unitarray,_position,_vehicletype,_faction,_side] call f_fnc_spawnVehicleGroup;
_group = _grpvehicle select 0;
_posdir = _attackposition call f_fnc_getdirpos;
_attackpos = _posdir select 0;

if (typename _attackposition == "STRING") then
{
    if (markerShape _attackposition ==  "RECTANGLE" || markerShape _attackposition == "ELLIPSE") then
    {
        [_group,_attackposition] call CBA_fnc_taskSearchArea;
    }
    else
    {
        [_group,_attackpos] call CBA_fnc_taskAttack;
    };
}
else
{
    [_group,_attackpos] call CBA_fnc_taskAttack;
};


{
    _x allowFleeing 0;
    _x setspeedmode "FULL";
    _x setbehaviour "SAFE";
    _x setskill ["spotDistance",0.1];
    _x setskill ["spotTime",0.1];
    _x setskill ["courage",1];
    _x setskill ["commanding",0.1];
    _x setskill ["general",0.1];

} forEach (units _group);

_grpvehicle
