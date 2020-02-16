#include "macros.hpp"
#define SHOULD_CONTINUE f_var_downtimeExperienceActive

CLIENT_ONLY;

SHOULD_CONTINUE = true;

// BUB 2020-02-14 TODO :: This will be weird on death, make the wait-time specific to unconscious players.
sleep DOWNTIME_WAIT_TIME;

if (!SHOULD_CONTINUE) exitWith {};

while {SHOULD_CONTINUE} do
{
    if (isNil "f_script_downtimeActivityCurrent" or {scriptDone f_script_downtimeActivityCurrent}) then
    {
        _chosenDowntimeActivity = missionNamespace getVariable ["f_var_downtimeActivity", ACTIVITY_UNDEFINED];

        _activityHandle = ASYNC_FUNC_HANDLE_DYNAMIC(_chosenDowntimeActivity);

        if !(isNil "_activityHandle") exitWith
        {
            f_script_downtimeActivityCurrent = _activityHandle;
        };

        f_script_downtimeActivityCurrent = [] spawn _chosenDowntimeActivity;

    };

    if (isNil 'f_script_downtimeActivityCurrent') then {systemChat "what...";};

    waitUntil {scriptDone f_script_downtimeActivityCurrent};

};
