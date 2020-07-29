// CA respawn system with wave respawns

#include "macros.hpp"

params ["_corpse", "_killer"];

DEBUG_PRINT_LOG("[RespawnWaves] Player was killed.")

CLIENT_ONLY;
LOCAL_ONLY(_corpse);

#include "..\parts\zeusAdditions_onKilled.sqf"


// MAKE SURE THE PLAYER INITIALIZES PROPERLY
WAIT_UNTIL_PLAYER_EXISTS();


DEBUG_PRINT_LOG("[RespawnWaves] Player exists, entering spectator...")

f_var_playerHasBeenKilled = true;
f_var_playerOriginalGroup = group player;

[_corpse] joinSilent grpNull;
