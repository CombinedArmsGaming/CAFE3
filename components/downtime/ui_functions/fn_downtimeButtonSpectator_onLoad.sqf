#include "..\macros.hpp"

params ["_button"];

while {IS_TRUE(f_var_showingDowntimeButton)} do
{
    waitUntil
    {
        ((!(uiNamespace getVariable ["RscEGSpectator_interfaceVisible", false])) and {!IS_TRUE(ace_spectator_uiVisible)}) or
        {IS_TRUE(f_var_downtimeActivitySelector_isOpen)}
    };

    _button ctrlSetFade 1;
    _button ctrlCommit 0.5;

    waitUntil
    {
        ((uiNamespace getVariable ["RscEGSpectator_interfaceVisible", false]) or {IS_TRUE(ace_spectator_uiVisible)}) and
        {!IS_TRUE(f_var_downtimeActivitySelector_isOpen)}
    };

    _button ctrlSetFade 0;
    _button ctrlCommit 0.5;

};
