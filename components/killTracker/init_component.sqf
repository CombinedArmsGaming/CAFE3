#include "macros.hpp"

#ifdef ENABLE_KILL_TRACKING

DEBUG_PRINT_LOG("initting kill tracker")

if (isServer) then
{
	missionNamespace setVariable [FULL_KILL_LOG_KEY_SERVER, []];

	[] spawn
	{
		while {true} do
		{
			uiSleep 15;

			[] call f_fnc_transmitKillsToRecipients;

		};

	};

	WAIT_UNTIL_MISSION_STARTED();
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


	addMissionEventHandler ["Ended",
	{
		saveProfileNamespace;
	}];

};

#else

DEBUG_PRINT_LOG("[TrackKills] Called init_component but ENABLE_KILL_TRACKING is not defined.")

#endif
