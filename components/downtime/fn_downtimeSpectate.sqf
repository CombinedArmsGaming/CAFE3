#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeSpectate);

_whenGhost =
{
    player allowDamage false;
    player setVariable ["ace_medical_allowDamage", false];

    [player, "CA2_Downtime"] call ace_common_fnc_hideUnit;
    [player, "CA2_Downtime"] call ace_common_fnc_muteUnit;

};

_whenAlive =
{
    player allowDamage true;
    player setVariable ["ace_medical_allowDamage", true];

    [player, "CA2_Downtime"] call ace_common_fnc_unhideUnit;
    [player, "CA2_Downtime"] call ace_common_fnc_unmuteUnit;

};


if !(SHOULD_CONTINUE) exitWith {};

// Can't move around in spectator while unconscious unless we do this...
["unconscious", false] call ace_common_fnc_setDisableUserInputStatus;

// BUB 2020-02-29 TODO :: turn this into a loop that checks if player is unconscious or dead/"ghost".  If dead hide player, else don't.
[true, true, false] call ace_spectator_fnc_setSpectator;


_isGhost = PLAYER_IS_GHOST;

if (_isGhost) then
{
    [] call _whenGhost;
};


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


[] call _whenAlive;

[false, true, false] call ace_spectator_fnc_setSpectator;
