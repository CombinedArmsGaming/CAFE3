#include "macros.hpp"

/*
 * Author: Poulern, edited by Joecuronium and Bubbus.
 * Spawns a vehicle with a crew inside of it and an optional transported reinforcement squad.
 *
 * Arguments:
 * 0: F3 group array
 * 1: Spawn position, marker, object, group, location, array
 * 2: Vehicle classname
 * 3: Faction of group used in F3 Assigngear.
 * 4: Side of units spawned, west east independent
 *
 * Return Value:
 * Array of [group, vehicle, reinforcement group]
 *
 */

params ["_unitarray", "_position", "_vehicletype", ["_faction",""], ["_side", f_defaultSide], ["_suppressive",false], ["_guerrilla",false], ["_enableAdvancedAI",true], ["_runAfter",[]], ["_reinforcementarray", []]];


_reinforcementsExist = ((count _reinforcementarray) > 0);

_vehicle = [_position, _vehicletype] call f_fnc_spawnVehicle;
_group = [_unitarray, _position, _faction, _side, _suppressive, _guerrilla, _enableAdvancedAI] call f_fnc_spawnGroup;



_units = units _group;
_assigned = [];

_comno = true;
_drino = true;
_gunno = true;

{

    if ((_vehicle emptyPositions "Commander") > 0 && _comno) then
    {
        _check = (_x in _assigned);

        if (!_check) then
        {
            _x assignAsCommander _vehicle;
            _x moveInCommander _vehicle;
            _assigned pushBackUnique _x;
            _comno = false;

        };

    };

    if ((_vehicle emptyPositions "Driver") > 0 && _drino) then
    {
        _check = (_x in _assigned);

        if (!_check) then
        {
            _x assignAsDriver _vehicle;
            _x moveInDriver _vehicle;
            _assigned pushBackUnique _x;
            _drino = false;

        };

    };

    if ((_vehicle emptyPositions "Gunner") > 0 && _gunno) then
    {
        _check = (_x in _assigned);

        if (!_check) then
        {
            _x assignAsGunner _vehicle;
            _x moveInGunner _vehicle;
            _assigned pushBackUnique _x;
            _gunno = false;

        };

    };

    _check = (_x in _assigned);

    if (!_check) then
    {
        _x assignAsCargo _vehicle;
        _x moveInAny _vehicle;
        _assigned pushBackUnique _x;

    };

} forEach _units;

_units orderGetIn true;


if (_reinforcementsExist) then
{
    _reinforcementsGroup = [_reinforcementarray, _position, _faction, _side, _suppressive, _guerrilla, _enableAdvancedAI] call f_fnc_spawnGroup;
    _reinforcementUnits = units _reinforcementsGroup;

    {
        _check = (_x in _assigned);

        if (!_check) then
        {
            _x assignAsCargo _vehicle;
            _x moveInAny _vehicle;
            _assigned pushBackUnique _x;
        };

    } forEach _reinforcementUnits;

    _unloadPos = _vehicle modelToWorld [0,100,0];
    _reinfPos = _vehicle modelToWorld [0,200,0];

    _crewWaypoint = _group addWaypoint [_unloadPos, 0, 0];
    _crewWaypoint setWaypointType "TR UNLOAD";

    //Check if vehicle has Gunner, if yes, it holds at unloadPos, if no it returns to spawn (doesn't always work because ARMA)
    if (!_gunno) then
    {
        deleteWaypoint [_group,1];
    };

    _squadWaypoint = _reinforcementsGroup addWaypoint [_reinfPos, 0, 0];
    deleteWaypoint [_reinforcementsGroup, 1];

};


if ((typeName _runAfter) isEqualTo "CODE") then
{
	[_group, _vehicle, _reinforcementsGroup] call _runAfter;
};

[_group, _vehicle, _reinforcementsGroup]
