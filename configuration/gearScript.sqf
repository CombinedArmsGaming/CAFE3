#include "macros.hpp"
if !(isNil "f_var_gearscript_already_run") exitWith {DEBUG_PRINT_LOG("[GEARSCRIPT-2]: Gearscript tried running multiple times.")};
#include "..\gearscript_macros.hpp"
f_var_gearscript_already_run = true;

// Configure sides below.
// Supported sides are: BLUFOR, OPFOR, INDFOR, Guerrilla, Civilian.

#include "loadouts\gear_blufor.sqf"

#include "loadouts\gear_opfor.sqf"

#include "loadouts\gear_indfor.sqf"

#include "loadouts\gear_guerrilla.sqf"

#include "loadouts\gear_civilian.sqf"
