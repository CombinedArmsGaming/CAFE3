#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeMonitor);


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
    f_var_firstUnconsciousWait = true;
    waitUntil { sleep 0.1; PLAYER_IS_DOWN };

    RUN_FUNC_ONCE_ASYNC(f_fnc_downtimeExperience)

    while {PLAYER_IS_DOWN} do
    {
        waitUntil { ((!PLAYER_IS_DOWN) or {ASYNC_FUNC_DONE(f_fnc_downtimeExperience)}) };

        if (ASYNC_FUNC_DONE(f_fnc_downtimeExperience)) then
        {
            RUN_FUNC_ASYNC(f_fnc_downtimeExperience)
        };

    };

    [] call _stopDowntimeExperience;

    false

};
