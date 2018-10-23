#include "macros.hpp"

DEBUG_PRINT_LOG("[GEARSCRIPT-2]: Entering assignGearWaited...")

// BUB 2018-10-23 TODO :: Alternative 'recursive' switch to scheduled.

waitUntil {time > 1};

_unit = _this select 1;

LOCAL_ONLY(_unit);

DEBUG_PRINT_LOG("[GEARSCRIPT-2]: Is local.")

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

// DECLARE VARIABLES AND FUNCTIONS 2
// Used by the faction-specific scripts

// ====================================================================================

// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.

_unit setVariable ["f_var_assignGear_done",false,true];

// ====================================================================================

DEBUG_FORMAT1_CHAT("DEBUG (assignGear.sqf): unit faction: %1",_faction);

// ====================================================================================

// ====================================================================================

// GEAR: BLUFOR > NATO
// The following block of code executes only if the unit is in a NATO slot; it
// automatically includes a file which contains the appropriate equipment data.

_gearVariant = _faction;


if (_faction in ["blu_f", "blu_t_f", "blu_ctrg_f", "blu_gen_f"]) then
{
    _gearVariant = "blufor";
};


// ====================================================================================

// GEAR: OPFOR > CSAT
// The following block of code executes only if the unit is in a CSAT slot; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["opf_f", "opf_t_f"]) then
{
	_gearVariant = "opfor";
};

// ====================================================================================

// GEAR: INDEPEDENT > AAF
// The following block of code executes only if the unit is in a AAF slot; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["ind_f", "ind_c_f"]) then
{
    _gearVariant = "indfor";
};

// ====================================================================================

// GEAR: FIA
// The following block of code executes only if the unit is in a FIA slot (any faction); it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_g_f","opf_g_f","ind_g_f"]) then
{
    _gearVariant = "guerrilla";
};


// ====================================================================================

// GEAR: CIVILIAN
// The following block of code executes only if the unit is in a civilian slot; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["civ_f","civ_idap_f"]) then
{
    _gearVariant = "civilian";
};

// ====================================================================================

if (_gearVariant == "") exitWith {};

[_unit, _typeofUnit, _gearVariant] call f_fnc_applyLoadout;


// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.

_unit setVariable ["f_var_assignGear_done",true,true];

// ====================================================================================

// BUB 2018-10-23 TODO :: Call radio config from gearscript instead of the other way around.
