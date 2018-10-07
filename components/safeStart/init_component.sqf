// F3 - Safe Start
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
//	This script inits the Mission Timer and the Safe Start, has the server setup the publicVariable
//      while the client waits, sets units invincibility and displays hints, then disables it.

#include "macros.hpp"

// BEGIN SAFE-START LOOP
// If a value was set for the mission-timer, begin the safe-start loop and turn on invincibility

DEBUG_PRINT_LOG("initting safestart")

if (f_var_mission_timer > 0) then
{
	// The server will handle the loop and notifications
	if (isServer) then {
		[] spawn f_fnc_safeStartLoop;
	};

	// Enable invincibility for players
	if (hasInterface) then {
		[true] call f_fnc_safety;
	};

};
