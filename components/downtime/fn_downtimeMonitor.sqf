#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeMonitor);

#define PLAYER_IS_DOWN (player getVariable ["ACE_isUnconscious", false] or {!alive player} or {missionNamespace getVariable ["f_var_playerHasBeenKilled", false]})


_stopDowntimeExperience =
{
    _funcHandle = ASYNC_FUNC_HANDLE(f_fnc_downtimeExperience);

    if (isNil "_funcHandle") exitWith {};

    if (scriptDone _funcHandle) exitWith
    {
        ASYNC_FUNC_HANDLE(f_fnc_downtimeExperience) = nil;
    };

    waitUntil
    {
        f_var_downtimeExperienceActive = false;
        scriptDone _funcHandle
    };

    ASYNC_FUNC_HANDLE(f_fnc_downtimeExperience) = nil;

};


waitUntil
{
    waitUntil { sleep 1; PLAYER_IS_DOWN };

    DEBUG_PRINT_CHAT("downtime!")
    RUN_FUNC_ONCE_ASYNC(f_fnc_downtimeExperience);

    waitUntil { !PLAYER_IS_DOWN };
    
    DEBUG_PRINT_CHAT("stoptime!")
    [] call _stopDowntimeExperience;

    false

};