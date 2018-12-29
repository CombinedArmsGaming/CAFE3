#include "macros.hpp"

#ifdef ENABLE_KILL_TRACKING

DEBUG_PRINT_LOG("initting kill tracker")

if (isServer) then
{
	profileNamespace setVariable ["bub_killTracking", []];

    DEBUG_FORMAT1_LOG("[TrackKills] Initial log state: %1",_killTracking)

	[] spawn
	{
		while {true} do
		{
			uiSleep 120;
			diag_log "[TrackKills] Saving log.";
			saveProfileNamespace;

			[] call f_fnc_transmitKillsToRecipients;

		};

	};

	waitUntil {sleep 1; time > 0};
	[] call f_fnc_trackStaticKillsInAO;

};

#else

DEBUG_PRINT_LOG("[TrackKills] Called init_component but ENABLE_KILL_TRACKING is not defined.")

#endif
