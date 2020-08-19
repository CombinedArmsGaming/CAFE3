#include "macros.hpp"

/*
 * Author: Poulern
 * Spawns a group that attacks a location or area.
 *
 * Arguments:
 * 0: array of units
 * 1: start position
 * 2: marker, position or location to attack. If marker is type of area, then it will use that instead.
 * 3: Faction of group used in F3 Assigngear.
 * 4: Side of units spawned, west east independent
 *
 * Return Value:
 * Group.
 *
 */

params ["_unitarray","_position","_attackposition",["_faction",""],["_side", f_defaultSide]];

_group = [_unitarray,_position,_faction,_side] call f_fnc_spawnGroup;
_posdir = _attackposition call f_fnc_getDirPos;
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

_group
