#include "macros.hpp"

DEBUG_PRINT_LOG("initting downtime")

// Should only run for players.
if (!hasInterface) exitWith {DEBUG_PRINT_LOG("jumped out of downtime")};

f_script_downtimeActivityCurrent = scriptNull;
f_var_downtimeExperienceActive = false;

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
waitUntil
{
	uiSleep 1;
	!isNull player
};

DEBUG_PRINT_LOG("finished waiting: downtime")

[] spawn f_fnc_downtimeMonitor;
