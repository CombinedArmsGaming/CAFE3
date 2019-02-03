
#include "macros.hpp"
CLIENT_ONLY;


if (f_var_respawnMode == 0) exitWith
{
    systemChat "HQ to command: Reinforcements are not available for this mission!";
};

if (f_var_respawnWavesAmount <= 0) exitWith
{
    systemChat "HQ to command: We are out of reinforcement waves!";
};

if (!ca_respawnready) exitWith
{
    systemChat "HQ to command: Reinforcements are not possible at this time!";
};


_spawnAt = switch (f_var_respawnMode) do
{
    case 1: {getMarkerPos f_var_respawnMarker};
    case 2: {player};

    default {getMarkerPos f_var_respawnMarker};

};


[_spawnAt] remoteExec ["f_fnc_respawnWaveServer", 2];
