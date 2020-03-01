#include "..\macros.hpp"

#define SHOULD_CONTINUE f_var_downtimeExperienceActive

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeSpectate);

if !(SHOULD_CONTINUE) exitWith {};

waitUntil
{
    if !(IS_TRUE(f_var_showingDowntimeButton) or {IS_TRUE(f_var_downtimeActivitySelector_isOpen)} or {!isNull (findDisplay 49)}) then
    {
        createDialog "CA2_DowntimeButton";
        sleep 2;
    };

    PLAYER_IS_GHOST or {!SHOULD_CONTINUE}
};

closeDialog 12343;

if !(SHOULD_CONTINUE) exitWith {};

[true, true, false] call ace_spectator_fnc_setSpectator;

waitUntil {!SHOULD_CONTINUE};

[false, true, false] call ace_spectator_fnc_setSpectator;
