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
 * Nothing
 *
 */
params ["_locationarray","_unitarray","_attackposition","_vehicletype",["_faction",""],["_side", f_defaultside]];
private ["_group","_grouparray"];

{
    [_unitarray,_x,_attackposition,_vehicletype,_faction,_side] call f_fnc_spawnvehicleattack;
} forEach _locationarray;
