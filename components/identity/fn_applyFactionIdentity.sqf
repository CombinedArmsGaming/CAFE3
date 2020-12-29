#include "macros.hpp"

/*
    Args:
        0: Unit to modify
        1: Faction to apply identity from (optional).
*/

params ["_unit"];

if (isNull _unit or {isPlayer _unit} or {_unit getVariable ["f_var_ignoreFactionIdentity", false]}) exitWith {};

_faction = toLower (param [1, faction _unit]);
_sideName = [_faction] call f_fnc_factionToSideName;

_identity = GET_FACTION_IDENTITY_DYNAMIC(_sideName);

[_unit, _identity] call f_fnc_applyIdentity;
