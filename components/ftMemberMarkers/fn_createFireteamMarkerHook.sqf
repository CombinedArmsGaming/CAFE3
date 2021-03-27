#include "macros.hpp"

#ifdef ENABLE_FIRETEAM_MARKERS

	RUN_AS_ASYNC(f_fnc_createFireteamMarkerHook);
	WAIT_UNTIL_SETTINGS_READY();

	params ["_display", "_control"];

	if (_display getVariable ["f_var_ftMarker_eventId", -1] >= 0) exitWith
	{
		DEBUG_FORMAT2_LOG("[FTMarkers] Aborted creating handler on display %1 with control %2 because it was already registered.",_display,_control)
	};

	DEBUG_FORMAT2_LOG("[FTMarkers] Creating handler on display %1 with control %2.",_display,_control)

	_eventId = _control ctrlAddEventHandler
	[
		"Draw",
		"_this call f_fnc_drawFireteamMarkers"
	];

	_display setVariable ["f_var_ftMarker_eventId", _eventId];

#endif
