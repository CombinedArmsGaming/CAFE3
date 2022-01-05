/*
 * Author: Poulern
 * Spawns a group that charges(attacks without formation, often in a line) a position a set distance away from the origin.
 * You must include a direction in the location parameter(IE have it be a marker, object or make the arrays look like this:[ [[2334,3242,0],90] , [[2334,3242,0],90] ](spaces added for clarity)) or else the group will charge north.
 *
 * Arguments:
 * 0: Spawn positions, marker, object, group, location, array
 * 1: CAFE group array
 * 2: Distance to charge. Recommended fall just a bit short of target. Set in meters
 * 3: Faction of group used in CAFE Assigngear.
 * 4: Side of units spawned, west east independent
 *
 * Return Value:
 * Nothing
 *
 */
params ["_locationarray","_unitarray","_attackdistance",["_faction",""],["_side", f_defaultside]];
private ["_group","_grouparray"];

{
    [_unitarray,_x,_attackdistance,_faction,_side] call f_fnc_spawncharge;
} forEach _locationarray;
