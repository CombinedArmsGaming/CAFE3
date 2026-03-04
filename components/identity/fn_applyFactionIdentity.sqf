#include "macros.hpp"

/*
    Args:
        0: Unit to modify
        1: Faction to apply identity from (optional).
*/

params ["_unit", ["_sideName", ""]];

if (isNull _unit or {isPlayer _unit} or {_unit getVariable ["f_var_ignoreFactionIdentity", false]}) exitWith {};

if (_sideName isEqualTo "") then
{
    private _faction = toLower (param [1, faction _unit]);
    _sideName = [_faction] call f_fnc_factionToSideName;
};

private _identity = GET_FACTION_IDENTITY_DYNAMIC(_sideName);

_unit setVariable ["f_var_identity", _identity, true];

[_unit, _identity] remoteExecCall ["f_fnc_applyIdentity", 0, false];
