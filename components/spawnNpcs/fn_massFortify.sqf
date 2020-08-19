/*
 * Author: Poulern
 * Spawns a group of ai at location for each location. Groups will mount nearby static machine guns and bunker in nearby buildings.
 *
 * Arguments:
 * 0: Spawn positions, marker, object, group, location, array
 * 1: F3 group array
 * 3: Faction of group used in F3 Assigngear.
 * 4: Side of units spawned, west east independent
 *
 * Return Value:
 * Nothing
 *
 */
params ["_locationarray","_unitarray",["_faction",""],["_side", f_defaultside]];
private ["_group","_grouparray"];

{
    [_unitarray,_x,_faction,_side] call f_fnc_spawnfortify;
} forEach _locationarray;
