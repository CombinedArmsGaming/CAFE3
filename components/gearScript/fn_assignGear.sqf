#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_assignGear);

_unit = _this select 1;
LOCAL_ONLY(_unit);

waitUntil { IS_TRUE(f_var_gearscript_loaded) };


_runningAlready = _unit getVariable ["f_var_assignGear_running",false];
if (_runningAlready) exitWith {};

_unit setVariable ["f_var_assignGear_running", true, true];
_unit setVariable ["f_var_assignGear_done", false, true];


// ====================================================================================

_typeofUnit = toLower (_this select 0);

_faction = toLower (faction _unit);

if (count _this > 2) then
{
    _faction = toLower (_this select 2);
};


DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Attempting to apply '%1' loadout for faction '%2'.",_typeofUnit,_faction)


// ====================================================================================

_unit setVariable ["f_var_assignGear", _typeofUnit, true];
_unit setVariable ["f_var_assignGear_Faction", _faction, true];

// ====================================================================================

_gearVariant = [_faction] call f_fnc_factionToGearVariant;

if (_gearVariant == "") exitWith {};

[_unit, _typeofUnit, _gearVariant] call f_fnc_applyLoadout;


if (isPlayer _unit) then
{
    sleep 1;
    [_unit] call f_fnc_clientRadioInit;
};

// ====================================================================================

_unit setVariable ["f_var_assignGear_done", true, true];
_unit setVariable ["f_var_assignGear_running", false, true];

// ====================================================================================

if (isPlayer _unit) then
{
    [_unit] spawn f_fnc_addInsigniaMonitor;
};
