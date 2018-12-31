#include "macros.hpp"

#ifdef ENABLE_KILL_TRACKING

DEBUG_PRINT_LOG("initting kill tracker")

if (isServer) then
{
	profileNamespace setVariable [FULL_KILL_LOG_KEY_SERVER, []];

	[] spawn
	{
		while {true} do
		{
			uiSleep 15;
			saveProfileNamespace;

			[] call f_fnc_transmitKillsToRecipients;

		};

	};

	waitUntil {sleep 1; time > 0};
	[] call f_fnc_trackStaticKillsInAO;

};

if (hasInterface) then
{
	_killLogs = profileNamespace getVariable [FULL_KILL_LOG_KEY_CLIENT, []];

	if (_killLogs isEqualTo []) then
	{
		profileNamespace setVariable [FULL_KILL_LOG_KEY_CLIENT, []];
	};

	f_var_currentKillLogIndex = count _killLogs;

};

#else

DEBUG_PRINT_LOG("[TrackKills] Called init_component but ENABLE_KILL_TRACKING is not defined.")

#endif
