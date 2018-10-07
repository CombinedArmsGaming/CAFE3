#include "macros.hpp"

DEBUG_PRINT_LOG("initting briefing")

// Should only run for players.
if (!hasInterface) exitWith {DEBUG_PRINT_LOG("jumped out of briefing")};

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
waitUntil
{
	uiSleep 1;
	!isNull player
};

DEBUG_PRINT_LOG("finished waiting: briefing")

[] call f_fnc_briefing;
