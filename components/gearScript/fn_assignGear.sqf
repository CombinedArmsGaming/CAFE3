#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_assignGear);

_unit = _this select 1;
LOCAL_ONLY(_unit);

waitUntil { IS_TRUE(f_var_gearscript_loaded) };


_runningAlready = _unit getVariable ["f_var_assignGear_running",false];
if (_runningAlready) exitWith {};

_unit setVariable ["f_var_assignGear_running",true];
_unit setVariable ["f_var_assignGear_done",false,true];


// ====================================================================================

// DETECT unit FACTION
// The following code detects what faction the unit's slot belongs to, and stores
// it in the private variable _faction. It can also be passed as an optional parameter.

_typeofUnit = toLower (_this select 0);

_faction = toLower (faction _unit);

if (count _this > 2) then
{
    _faction = toLower (_this select 2);
};


DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Attempting to apply '%1' loadout for faction '%2'.",_typeofUnit,_faction)

// ====================================================================================

// BUB 2018-10-22 TODO :: this.

// INSIGNIA
// This block will give units insignia on their uniforms.
/* [_unit,_typeofUnit] spawn {
	#include "f_assignInsignia.sqf"
}; */

// ====================================================================================

// SET A PUBLIC VARIABLE
// A public variable is set on the unit, indicating their type. This is mostly relevant for the F3 respawn component

_unit setVariable ["f_var_assignGear", _typeofUnit, true];
_unit setVariable ["f_var_assignGear_Faction", _faction, true];

// ====================================================================================

DEBUG_FORMAT1_CHAT("DEBUG (assignGear.sqf): unit faction: %1",_faction);

// ====================================================================================

_gearVariant = [_faction] call f_fnc_factionToGearVariant;

if (_gearVariant == "") exitWith {};

[_unit, _typeofUnit, _gearVariant] call f_fnc_applyLoadout;



if (isPlayer _unit) then
{
    sleep 1;
    [_unit] call f_fnc_clientRadioInit;
};

// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.

_unit setVariable ["f_var_assignGear_done",true,true];
_unit setVariable ["f_var_assignGear_running",false];

// ====================================================================================
