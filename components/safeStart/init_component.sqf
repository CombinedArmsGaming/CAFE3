// F3 - Safe Start
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
//	This script inits the Mission Timer and the Safe Start, has the server setup the publicVariable
//      while the client waits, sets units invincibility and displays hints, then disables it.

#include "macros.hpp"

SERVER_ONLY;

// BEGIN SAFE-START LOOP
// If a value was set for the mission-timer, begin the safe-start loop and turn on invincibility

DEBUG_PRINT_LOG("initting safestart")

WAIT_UNTIL_MISSION_STARTED();

waitUntil { sleep 1; f_var_safestart_end > 0 };

f_var_safeStartEnabled = true;
[] remoteExec ["f_fnc_enableSafeStart", 0, "SafeStartSync"];

[] call f_fnc_safeStartLoop;
