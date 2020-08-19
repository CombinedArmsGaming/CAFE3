/*
 * Author: Poulern
 * Spawns ai at each location specified. Each Ai will patrol in the area around it specified by the radius.
 *
 * Arguments:
 * 0: Spawn positions, marker, object, group, location, array
 * 1: F3 group array
 * 2: radius of area to patrol eg 200
 * 3: Faction of group used in F3 Assigngear.
 * 4: Side of units spawned, west east independent
 *
 * Return Value:
 * Nothing
 *
 */
params ["_locationarray","_unitarray",["_radius", 200, [2]],["_faction",""],["_side", f_defaultside]];
private ["_group","_grouparray"];

{
    [_unitarray,_x,_radius,_faction,_side] call f_fnc_spawnpatrol;
} forEach _locationarray;
