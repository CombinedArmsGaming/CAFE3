
#include "macros.hpp"
CLIENT_ONLY;


if (ca_respawnmode == 0) exitWith
{
    systemChat "HQ to command: Reinforcements are not available for this mission!";
};

if (ca_norespawnwaves <= 0) exitWith
{
    systemChat "HQ to command: We are out of reinforcement waves!";
};

if (!ca_respawnready) exitWith
{
    systemChat "HQ to command: Reinforcements are not possible at this time!";
};


_spawnAt = switch (ca_respawnmode) do
{
    case 1: {getMarkerPos ca_respawnmarker};
    case 2: {player};

    default {getMarkerPos ca_respawnmarker};

};


[_spawnAt] remoteExec ["f_fnc_respawnWaveServer", 2];
