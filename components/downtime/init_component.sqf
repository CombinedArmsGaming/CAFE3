#include "macros.hpp"

DEBUG_PRINT_LOG("initting downtime")

// Should only run for players.
if (!hasInterface) exitWith {DEBUG_PRINT_LOG("jumped out of downtime")};

//[] call f_fnc_setupDowntimeSelectorHotkey;

f_script_downtimeActivityCurrent = scriptNull;
f_var_downtimeExperienceActive = false;

f_var_downtimeActivity = ACTIVITY_SELECTOR;
f_var_downtimeRespawnMode = RESPAWN_ALWAYS;

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
waitUntil
{
	uiSleep 1;
	!isNull player
};

DEBUG_PRINT_LOG("finished waiting: downtime")

[] spawn f_fnc_downtimeMonitor;
[] spawn f_fnc_blockSelfInteractWhileUnconscious;
[] spawn f_fnc_addDowntimeButtonToSpectator;
[] spawn f_fnc_initControlActivityHandler;
