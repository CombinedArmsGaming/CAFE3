#include "..\macros.hpp"

#define SHOULD_CONTINUE f_var_downtimeExperienceActive

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeSpectate);

if !(SHOULD_CONTINUE) exitWith {};

// Can't move around in spectator while unconscious unless we do this...
["unconscious", false] call ace_common_fnc_setDisableUserInputStatus;

// BUB 2020-02-29 TODO :: turn this into a loop that checks if player is unconscious or dead/"ghost".  If dead hide player, else don't.
[true, true, false] call ace_spectator_fnc_setSpectator;

waitUntil {!SHOULD_CONTINUE};

if (player getVariable ["ACE_isUnconscious", false]) then
{
    ["unconscious", true] call ace_common_fnc_setDisableUserInputStatus;
};

[false, true, false] call ace_spectator_fnc_setSpectator;
