
#include "macros.hpp"
CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_respawnWave);

_side = side group player;

if (RESPAWN_MODE(_side) == RESPAWN_MODE_DISABLED) exitWith
{
    systemChat "Reinforcements are not available for this mission!";
};

if (RESPAWN_WAVES(_side) <= 0) exitWith
{
    systemChat format ["%1 is out of reinforcement waves!", toUpper (str _side)];
};

if !(RESPAWN_WAVE_READY(_side)) exitWith
{
    systemChat "Reinforcements are not possible at this time!";
};


_spawnAt = switch (RESPAWN_MODE(_side)) do
{
    case RESPAWN_MODE_BASE: {RESPAWN_ENTITY(_side)};
    case RESPAWN_MODE_COMMANDER:
    {
        if ((groupId group player) isEqualTo "Spectators") then
        {
            RESPAWN_ENTITY(_side)
        }
        else
        {
            player
        }

    };

};

if (isNull _spawnAt) then
{
    _spawnAt = RESPAWN_MARKER_POS(_side);
};

// Originally introduced to test group propagation latency.  The delay feels nice.  Keeping it.
systemChat "Your reinforcements will arrive in five seconds, stand by...";
uiSleep 5;

[_spawnAt, _side] remoteExec ["f_fnc_respawnWaveServer", 2];
