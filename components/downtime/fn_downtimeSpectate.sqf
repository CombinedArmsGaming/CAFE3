#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeSpectate);

_whenGhost =
{
    [false] call f_fnc_updateDowntimeSpectatorCameraModes;
};


_whenAlive =
{
    [true] call f_fnc_updateDowntimeSpectatorCameraModes;
};


_whenDone =
{
    [false] call f_fnc_updateDowntimeSpectatorCameraModes;

    "CAFE_CutDowntime" cutFadeOut 0;

    isNil
    {
        if (IS_UNCONSCIOUS(player)) then
        {
            // Need to re-apply the unconscious keyblocker or else unconscious people can wiggle around.
            // Happens when people opt-out of spectator while it's in effect.
            ["unconscious", true] call ace_common_fnc_setDisableUserInputStatus;
        };
    };

};


if !(SHOULD_CONTINUE) exitWith {};

// Can't move around in spectator while unconscious unless we do this...
["unconscious", false] call ace_common_fnc_setDisableUserInputStatus;

[true, true, false] call ace_spectator_fnc_setSpectator;

_isDead = PLAYER_IS_DEAD;
[] call (if (PLAYER_IS_DEAD) then {_whenGhost} else {_whenAlive});

waitUntil
{
    if !(PLAYER_IS_DEAD isEqualTo _isDead) then
    {
        [] call (if (PLAYER_IS_DEAD) then {_whenGhost} else {_whenAlive});
        _isDead = PLAYER_IS_DEAD;
    };

    sleep 0.1;
    !SHOULD_CONTINUE
};


[] call _whenDone;

[false, true, false] call ace_spectator_fnc_setSpectator;
