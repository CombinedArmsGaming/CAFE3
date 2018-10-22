#include "macros.hpp"

_unit = _this select 1;

LOCAL_ONLY(_unit);


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

if (_faction in ["blu_f", "blu_t_f", "blu_ctrg_f", "blu_gen_f"]) then
{
    #include "loadouts\gear_blufor.sqf"
};


// ====================================================================================

// GEAR: OPFOR > CSAT
// The following block of code executes only if the unit is in a CSAT slot; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["opf_f", "opf_t_f"]) then
{
	#include "loadouts\gear_opfor.sqf"
};

// ====================================================================================

// GEAR: INDEPEDENT > AAF
// The following block of code executes only if the unit is in a AAF slot; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["ind_f", "ind_c_f"]) then
{
	#include "loadouts\gear_indfor.sqf";
};

// ====================================================================================

// GEAR: FIA
// The following block of code executes only if the unit is in a FIA slot (any faction); it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["blu_g_f","opf_g_f","ind_g_f"]) then
{
	#include "loadouts\gear_guerrilla.sqf"
};


// ====================================================================================

// GEAR: CIVILIAN
// The following block of code executes only if the unit is in a civilian slot; it
// automatically includes a file which contains the appropriate equipment data.

if (_faction in ["civ_f","civ_idap_f"]) then
{
	#include "loadouts\gear_civilian.sqf"
};

// ====================================================================================

// This variable simply tracks the progress of the gear assignation process, for other
// scripts to reference.

_unit setVariable ["f_var_assignGear_done",true,true];

// ====================================================================================

// DEBUG

// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

if (isNil "_carbine") then { //_carbine should exist unless no faction has been called
	player globalchat format ["DEBUG (assignGear.sqf): Faction %1 is not defined.",_faction];
} else {
 	if (f_var_debugMode == 1) then	{
		player sideChat format ["DEBUG (assignGear.sqf): Gear for %1: %1 slot selected.",_unit,_faction,_typeofUnit];
	};
};

// ====================================================================================
