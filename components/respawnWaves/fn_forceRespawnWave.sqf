
#include "macros.hpp"
CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_forceRespawnWave);

params ["_side"];

_spawnAt = switch (RESPAWN_MODE(_side)) do
{
    case RESPAWN_MODE_BASE:
    {
        systemChat "Your reinforcements will arrive at the default respawn location in 10 seconds...";
        RESPAWN_ENTITY(_side)
    };
    
    case RESPAWN_MODE_COMMANDER:
    {
        if ((groupId group player) isEqualTo "Spectators") then
        {
            systemChat "Your reinforcements will arrive at the default respawn location in 10 seconds...";
            RESPAWN_ENTITY(_side)
        }
        else
        {
            systemChat "Your reinforcements will arrive ON YOUR POSITION in 10 seconds...";
            player
        }

    };

};

if (isNull _spawnAt) then
{
    _spawnAt = RESPAWN_MARKER_POS(_side);
};

uiSleep 10;

[_spawnAt, _side] remoteExec ["f_fnc_respawnWaveServer", 2];
