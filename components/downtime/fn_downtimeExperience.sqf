#include "macros.hpp"
#define SHOULD_CONTINUE f_var_downtimeExperienceActive

CLIENT_ONLY;

SHOULD_CONTINUE = true;

_timeStartWait = time;
waitUntil
{
    sleep 0.1;
    (time > (_timeStartWait + 10)) or {!IS_TRUE(f_var_firstUnconsciousWait)} or {!SHOULD_CONTINUE} or {PLAYER_IS_GHOST}
};

f_var_firstUnconsciousWait = false;

if (!SHOULD_CONTINUE) exitWith {};

while {SHOULD_CONTINUE} do
{
    if (isNil "f_script_downtimeActivityCurrent" or {scriptDone f_script_downtimeActivityCurrent}) then
    {
        _chosenDowntimeActivity = missionNamespace getVariable ["f_var_downtimeActivity", ACTIVITY_SELECTOR];
        _activityAsFunction = GET_ACTIVITY(_chosenDowntimeActivity);

        _activityHandle = ASYNC_FUNC_HANDLE_DYNAMIC(_activityAsFunction);

        if !(isNil "_activityHandle") exitWith
        {
            DEBUG_PRINT_CHAT("Downtime activity already started, adopting and exiting.")
            f_script_downtimeActivityCurrent = _activityHandle;
        };

        DEBUG_FORMAT1_CHAT("Starting downtime activity %1",_chosenDowntimeActivity)

        f_script_downtimeActivityCurrent = [] spawn _activityAsFunction;

    };

    waitUntil {scriptDone f_script_downtimeActivityCurrent};
    DEBUG_PRINT_CHAT("Downtime activity finished.")

    sleep 0.1;

};
