// This script initialises the Ceasefire component.

#include "../../macros.hpp"

SERVER_ONLY;
DEBUG_PRINT_LOG("Initialising Ceasefire")





// Initialise global variables
if (isNil "cafe_ceasefire_active") then {cafe_ceasefire_active = false};





private _initialDuration = CEASEFIRE_DURATION_ON_MISSION_START;

// Only call the ceasefire function if we need to (might help improve performance on mission init)
if (_initialDuration > 0) then {
	[true, _initialDuration] call f_fnc_ceasefire;
};
