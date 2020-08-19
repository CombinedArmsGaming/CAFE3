/*
 * Author: Poulern
 * Spawns a static vehicle on each location specified. Vehicle has no fuel, so cannot move.
 *
 * Arguments:
 * 0: An array of markers ["mkr","mkr_1","mkr_2","mkr_3"]
 * 1: array of units according to F3 ["ftl","r","ar","aar","rat"]
 * 2: Vehicle classname
 * 3: Faction of group used in F3 Assigngear.
 * 4: Side of units spawned, west east independent
 *
 * Return Value:
 * Nothing
 *
 */
params ["_locationarray","_unitarray","_vehicletype",["_faction",""],["_side", f_defaultside]];
private ["_group","_grouparray"];

{
    [_unitarray,_x,_vehicletype,_faction,_side] call f_fnc_spawnvehiclestatic;
} forEach _locationarray;
