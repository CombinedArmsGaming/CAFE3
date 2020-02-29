#include "..\macros.hpp"

#define SHOULD_CONTINUE f_var_downtimeExperienceActive

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeSpectate);

if !(SHOULD_CONTINUE) exitWith {};

waitUntil { PLAYER_IS_GHOST or {!SHOULD_CONTINUE} };

if !(SHOULD_CONTINUE) exitWith {};

[true, true, false] call ace_spectator_fnc_setSpectator;

waitUntil {!SHOULD_CONTINUE};

[false, true, false] call ace_spectator_fnc_setSpectator;
