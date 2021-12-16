#include "macros.hpp"

/*
 * Author: Poulern, edited by Joecuronium and Bubbus.
 * Spawns a vehicle with a crew inside of it and an optional transported reinforcement squad.
 *
 * Arguments:
 * 0: CAFE group array
 * 1: Spawn position, marker, object, group, location, array
 * 2: Vehicle classname
 * 3: Faction of group used in CAFE Assigngear.
 * 4: Side of units spawned, west east independent
 *
 * Return Value:
 * Array of [group, vehicle, reinforcement group]
 *
 */

params ["_unitarray", "_position", "_vehicletype", ["_faction",""], ["_side", f_defaultSide], ["_suppressive",false], ["_guerrilla",false], ["_enableAdvancedAI",true], ["_runAfter",[]], ["_reinforcementarray", []], ["_dir",0]];


_reinforcementsExist = ((count _reinforcementarray) > 0);

_spawnVicArray = [_position, _vehicletype, 0, _dir] call f_fnc_spawnVehicle;
_group = [_unitarray, _position, _faction, _side, _suppressive, _guerrilla, _enableAdvancedAI] call f_fnc_spawnGroup;

_vehicle = _spawnVicArray select 0;
_isAir = _spawnVicArray select 1;

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


private _returnList = [_group, _vehicle];

if (_reinforcementsExist) then
{
    _reinforcementsGroup = [_reinforcementarray, _position, _faction, _side, _suppressive, _guerrilla, _enableAdvancedAI] call f_fnc_spawnGroup;
    _reinforcementUnits = units _reinforcementsGroup;

    _returnList = _returnList + [_reinforcementsGroup];

    {
        _check = (_x in _assigned);

        if (!_check) then
        {
            _x assignAsCargo _vehicle;
            _x moveInAny _vehicle;
            _assigned pushBackUnique _x;
        };

    } forEach _reinforcementUnits;

    _unloadPos = _vehicle modelToWorld [0,1000,0];
    _reinfPos = _vehicle modelToWorld [0,1100,0];

    _crewWaypoint = _group addWaypoint [_unloadPos, 0, 0];
    _crewWaypoint setWaypointType "TR UNLOAD";

    //Check if vehicle has Gunner, if yes, it holds at unloadPos, if no it returns to spawn (doesn't always work because ARMA). Helicopters always return to spawn. Upon return, vehicle is despawned
   
      deleteWaypoint [_group,1];

    if (_isAir || _gunno) then
    {
        _returnWaypoint = _group addWaypoint [_position, 0, 1];
        _returnWaypoint setWaypointStatements ["true", "deleteVehicle vehicle this; {deleteVehicle _x} forEach thisList"];
        _returnWaypoint setWaypointTimeout [5, 7.5, 10];
    };

    _squadWaypoint = _reinforcementsGroup addWaypoint [_reinfPos, 0, 0];
    deleteWaypoint [_reinforcementsGroup, 1];

};


if ((typeName _runAfter) isEqualTo "CODE") then
{
	_returnList call _runAfter;
};

_returnList
