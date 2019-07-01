#include "macros.hpp"

/*
 * Author: Poulern
 * Spawns a group that fortifies a location or area.
 *
 * Arguments:
 * 0: array of units
 * 1: start position
 * 3: Faction of group used in F3 Assigngear.
 * 4: Side of units spawned, west east independent
 *
 * Return Value:
 * Group.
 *
 * Example:
 * [["ftl","r","m","rat","ar","aar"],"SC1_FT_BF","opf_f",east] spawn f_fnc_spawnfortify;
 *
 */

RUN_ON_SERVER(f_fnc_spawnFortify,_this);

params ["_unitarray","_position",["_faction",""],["_side", f_defaultSide]];

_group = [_unitarray,_position,_faction,_side] call f_fnc_spawnGroup;

[_group,_group,50,1,false] call CBA_fnc_taskDefend;

_group
