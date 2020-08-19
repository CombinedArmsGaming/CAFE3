#include "macros.hpp"

/*
 * Author: Poulern
 * Spawns a group according to F3 assign gear
 *
 * Arguments:
 * 0: F3 group array
 * 1: Spawn position, marker, object, group, location, array
 * 2: Faction of group used in F3.
 * 2: Side west east independent
 *
 * Return Value:
 * Group
 *
 */

params ["_unitarray", "_position", ["_faction",""], ["_side", f_defaultSide], ["_suppressiveAI",false], ["_guerrillaAI",false], ["_runAfter",[]]];
private ["_spawnpos", "_unittype", "_unit", "_group", "_posdir", "_unittype"];

//Getting a good position from the parsed values
_posdir = _position call f_fnc_getDirPos;
_spawnpos = _posdir select 0;

switch (_side) do
{
	case west: {_group = createGroup [west,true]; _unittype = "B_Soldier_F";};
	case east: {_group = createGroup [east,true]; _unittype = "O_Soldier_F";};
	case independent: {_group = createGroup [independent,true]; _unittype = "I_Soldier_F";};
	default {_group = createGroup [east,true]};

};


{
    _unit = "";
	_unit = _group createUnit [_unittype, _spawnpos, [], 0, "FORM"];

    if (_faction == "") then
    {
        _faction = faction _unit;
    };

	_type = _x;
	[_type,_unit,_faction] call f_fnc_assignGear;

} forEach _unitarray;


[_group] call CBA_fnc_clearWaypoints;
_group setFormation "LINE";


if (isServer) then
{
	// Enable guerrilla AI, if desired
	if (_guerrillaAI isEqualType []) then
	{
		([_group] + _guerrillaAI) spawn f_fnc_groupGuerrillaAI;
	};

	// Enable suppressive AI, if desired
	if (_suppressiveAI isEqualType []) then
	{
		([_group] + _suppressiveAI) spawn f_fnc_groupSuppressiveAI;
	};

};


if ((typeName _runAfter) isEqualTo "CODE") then
{
	[_group] call _runAfter;
};

_group
