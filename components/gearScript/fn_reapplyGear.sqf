#include "macros.hpp"

params ["_unit"];

if (IS_PLAYER) then
{
    waitUntil {local player};
};

LOCAL_ONLY(_unit);

DEBUG_FORMAT1_LOG("[GEARSCRIPT-2]: Reapplying current loadout for unit %1.",(str _unit))

private _loadout = getUnitLoadout _unit;

private _typeOfUnit = _unit getVariable ["f_var_assignGear", ""];
private _faction = _unit getVariable ["f_var_assignGear_Faction", ""];

if ((_typeOfUnit isEqualTo "") or (_faction isEqualTo "")) exitWith
{
    DEBUG_FORMAT1_LOG("[GEARSCRIPT-2]: Could not reapply current loadout for unit %1 - not a gearscripted loadout.",(str _unit))
};

["CA_PreGearscriptUnit_Local", [_typeOfUnit, _unit, _faction, _loadout, []]] call CBA_fnc_localEvent;

DEBUG_FORMAT1_LOG("Final loadout: %1",_loadout)
_unit setUnitLoadout _loadout;

["CA_PostGearscriptUnit_Local", [_typeOfUnit, _unit, _faction, _loadout, []]] call CBA_fnc_localEvent;
