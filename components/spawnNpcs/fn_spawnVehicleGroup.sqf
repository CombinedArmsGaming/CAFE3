#include "macros.hpp"

/*
 * Author: Poulern
 * Spawns a vehicle with a crew inside of it
 *
 * Arguments:
 * 0: F3 group array
 * 1: Spawn position, marker, object, group, location, array
 * 2: Vehicle classname
 * 3: Faction of group used in F3 Assigngear.
 * 4: Side of units spawned, west east independent
 *
 * Return Value:
 * Array of [group,vehicle]
 *
 */

params ["_unitarray", "_position", "_vehicletype", ["_faction",""], ["_side", f_defaultSide], ["_suppressive",false], ["_guerrilla",false], ["_enableAdvancedAI",true], ["_runAfter",[]], ["_reinforcementarray", []]];


_reinfExists = ((count _reinforcementarray) > 0);

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



if (_reinfExists) then
{

        _reinfgroup = [_reinforcementarray, _position, _faction, _side, _suppressive, _guerrilla, _enableAdvancedAI] call f_fnc_spawnGroup;
        _reinf = units _reinfgroup;

        {

              _check = (_x in _assigned);

                if (!_check) then
                {
                      _x assignAsCargo _vehicle;
                      _x moveInAny _vehicle;
                      _assigned pushBackUnique _x;

                };


        }forEach _reinf;

        _unloadPos = _vehicle modelToWorld [0,100,0];
        _movePos = _vehicle modelToWorld [25,50,0];
        _reinfPos = _vehicle modelToWorld [0,200,0];
        _wp = _group addWaypoint [_unloadPos,0,0];
        _wp setWaypointType "TR UNLOAD";
        [_group, 1]setWaypointPosition [_movePos,0];

        _wp = _reinfgroup addWaypoint [_reinfPos,0,0];
        deleteWaypoint [_reinfgroup, 1];

        if ((typeName _runAfter) isEqualTo "CODE") then
        {
	        [_reinfgroup]call _runAfter;
        };

};


if ((typeName _runAfter) isEqualTo "CODE") then
{
	[_group, _vehicle] call _runAfter;
};

[_group, _vehicle]
