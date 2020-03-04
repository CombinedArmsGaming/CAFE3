#include "..\macros.hpp"

#define DIALOG_IS_OPEN (missionNamespace getVariable ["f_var_downtimeActivitySelector_isOpen", false])

params [["_openedOnTop", false, [false]]];

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeActivitySelector);

if !(_openedOnTop) then
{
    RUNNING_ACTIVITY = ACTIVITY_SELECTOR;
};

if !(DIALOG_IS_OPEN) then
{

    if (f_var_downtimeActivity isEqualTo ACTIVITY_SELECTOR) then
    {
        f_var_downtimeActivity = ACTIVITY_NOTHING;
    };

    f_var_downtimeDialogOpenedOnTop = _openedOnTop;

    createDialog "CA2_Downtime_Dialog";

    waitUntil
    {
        DIALOG_IS_OPEN
    };

};

waitUntil
{
    !DIALOG_IS_OPEN
};

f_var_downtimeDialogOpenedOnTop = nil;

if !(_openedOnTop) then
{
    RUNNING_ACTIVITY = nil;
};
