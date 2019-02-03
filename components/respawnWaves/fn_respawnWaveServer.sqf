
#include "macros.hpp"
RUN_AS_ASYNC(f_fnc_respawnWaveServer);
SERVER_ONLY;


params [["_posOrObject", []]];

if (_posOrObject isEqualTo []) then
{
    _posOrObject = getMarkerPos f_var_respawnMarker;
};


// Set variables so it cannot be spammed
missionNamespace setVariable ['ca_lastRespawnWaveArgs', _posOrObject, true];
missionNamespace setVariable ['ca_respawnwave', [true, _posOrObject], true];
missionNamespace setVariable ['ca_respawnready', false, true];

//Remove a wave
_number = f_var_respawnWavesAmount;
missionNamespace setVariable ['f_var_respawnWavesAmount', (_number - 1), true];

// Post message letting everyone know there is a wave on.
f_var_respawnMessage remoteExec ["systemChat"];

//Let the wave last for 60 seconds just incase anyone dies etc.
_time = time;
missionNamespace setVariable ['ca_respawntime', _time, true]; // For the countdown on the respawn panel.
sleep f_var_waveTime;

missionNamespace setVariable ['ca_respawnwave', false, true];
sleep f_var_waveCooldown;

missionNamespace setVariable ['ca_respawnready', true, true];
