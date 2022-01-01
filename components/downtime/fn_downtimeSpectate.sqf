#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeSpectate);

_whenGhost =
{
    player allowDamage false;
    player setVariable ["ace_medical_allowDamage", false];

    [player, "CAFE_Downtime"] call ace_common_fnc_hideUnit;
    [player, "CAFE_Downtime"] call ace_common_fnc_muteUnit;

    [false] call f_fnc_updateDowntimeSpectatorCameraModes;

    [] spawn
    {
        uiSleep 1;

        if (PLAYER_IS_GHOST) then
        {
            "CAFE_CutDowntime" cutRsc ["CAFE_DowntimeDead", "PLAIN", -1, false];
        };

    };

};


_whenAlive =
{
    player allowDamage true;
    player setVariable ["ace_medical_allowDamage", true];

    [player, "CAFE_Downtime"] call ace_common_fnc_unhideUnit;
    [player, "CAFE_Downtime"] call ace_common_fnc_unmuteUnit;

    [true] call f_fnc_updateDowntimeSpectatorCameraModes;

    [] spawn
    {
        uiSleep 1;

        if (IS_UNCONSCIOUS(player)) then
        {
            "CAFE_CutDowntime" cutRsc ["CAFE_DowntimeUnconscious", "PLAIN", -1, false];
        };

    };

};


_whenDone =
{
    player allowDamage true;
    player setVariable ["ace_medical_allowDamage", true];

    [player, "CAFE_Downtime"] call ace_common_fnc_unhideUnit;
    [player, "CAFE_Downtime"] call ace_common_fnc_unmuteUnit;

    [false] call f_fnc_updateDowntimeSpectatorCameraModes;

    "CAFE_CutDowntime" cutFadeOut 0;
    "CAFE_DowntimeRespawn" cutFadeOut 0;

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

_isGhost = PLAYER_IS_GHOST;
[] call (if (PLAYER_IS_GHOST) then {_whenGhost} else {_whenAlive});

waitUntil
{
    if !(PLAYER_IS_GHOST isEqualTo _isGhost) then
    {
        [] call (if (PLAYER_IS_GHOST) then {_whenGhost} else {_whenAlive});
        _isGhost = PLAYER_IS_GHOST;
    };

    sleep 0.1;
    !SHOULD_CONTINUE
};


[] call _whenDone;

[false, true, false] call ace_spectator_fnc_setSpectator;
