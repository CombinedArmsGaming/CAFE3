#include "macros.hpp"

#ifdef ENABLE_SQUAD_MARKERS

	RUN_AS_ASYNC(f_fnc_createSquadMarkerHook);
	WAIT_UNTIL_SETTINGS_READY();

	params ["_display", "_control"];

	// If ft markers are enabled, wait until this display has ft markers hooked.  Draw calls should occur in inverse order of registration.
	#ifdef ENABLE_FIRETEAM_MARKERS

		if (_display getVariable ["f_var_ftMarker_eventId", -1] < 0) then
		{
			DEBUG_FORMAT1_LOG("[SquadMarkers] Waiting for display %1 to get a ft-marker hook registered.",_display)
			waitUntil
			{
				uiSleep 1;
				_display getVariable ["f_var_ftMarker_eventId", -1] >= 0
			};
		};

	#endif

	if (_display getVariable ["f_var_squadMarker_eventId", -1] >= 0) exitWith
	{
		DEBUG_FORMAT2_LOG("[SquadMarkers] Aborted creating handler on display %1 with control %2 because it was already registered.",_display,_control)
	};

	DEBUG_FORMAT2_LOG("[SquadMarkers] Creating handler on display %1 with control %2.",_display,_control)

	_eventId = _control ctrlAddEventHandler
	[
		"Draw",
		"_this call f_fnc_drawSquadMarkers"
	];

	_display setVariable ["f_var_squadMarker_eventId", _eventId];

#endif
