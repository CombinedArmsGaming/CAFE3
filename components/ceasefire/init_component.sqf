// This script initialises the Ceasefire component.

#include "../../macros.hpp"

DEBUG_PRINT_LOG("Initialising Ceasefire")





// Initialise global variables
if (isNil "cafe_ceasefire_active") then {cafe_ceasefire_active = false};





// The remainder of this function shall be executed by the server only
SERVER_ONLY;

private _initialDuration = CEASEFIRE_DURATION_ON_MISSION_START;

#ifdef CEASEFIRE_JUSTIFICATION_ON_MISSION_START
	private _justification = CEASEFIRE_JUSTIFICATION_ON_MISSION_START;
#else
	private _justification = "";
#endif

// Only call the ceasefire function if we need to (might help improve performance on mission init)
if (_initialDuration > 0) then {

	// Delay the ceasefire until mission start (fixes units being captive on briefing)
	waitUntil {
		sleep 0.1;
		time > 0
	};

	[true, _initialDuration, _justification] call f_fnc_ceasefire;
};
