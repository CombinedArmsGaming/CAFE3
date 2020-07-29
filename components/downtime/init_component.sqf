#include "macros.hpp"

DEBUG_PRINT_LOG("initting downtime")

// Should only run for players.
if (!hasInterface) exitWith {DEBUG_PRINT_LOG("jumped out of downtime")};

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
waitUntil
{
	uiSleep 1;
	!isNull player
};

DEBUG_PRINT_LOG("finished waiting: downtime")

[] spawn f_fnc_downtimeMonitor;
[] spawn f_fnc_blockSelfInteractWhileUnconscious;
