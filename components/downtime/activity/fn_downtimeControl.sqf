#include "..\macros.hpp"

#define SHOULD_CONTINUE f_var_downtimeExperienceActive

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeControl);

if !(SHOULD_CONTINUE) exitWith {};

RUNNING_ACTIVITY = ACTIVITY_REMOTECONTROL;

while {SHOULD_CONTINUE} do
{
    _toControl = objNull;

    // Unfortunately control can't occur when player has died - it screws everything up.  Wait for player to respawn.
    waitUntil { (alive player) or {!SHOULD_CONTINUE} };

    if !(SHOULD_CONTINUE) exitWith {};

    if (isNil 'bis_fnc_moduleRemoteControl_unit') then
    {
        [player] remoteExec ["f_fnc_requestDowntimeControl", 2];

        waitUntil
        {
            titleText ["Waiting for a unit to become available...", "PLAIN", 0.15, true, true];

            if !(IS_TRUE(f_var_showingDowntimeButton) or {IS_TRUE(f_var_downtimeActivitySelector_isOpen)} or {!isNull (findDisplay 49)}) then
            {
                createDialog "CA2_DowntimeButton";
                sleep 1;
            };

            sleep 1;

            !((isNil 'bis_fnc_moduleRemoteControl_unit') and {SHOULD_CONTINUE})

        };

        CLOSE_DOWNTIME_BUTTON

    };

};

[] call f_fnc_stopRemoteControlUnit;

RUNNING_ACTIVITY = nil;
