// CA respawn system with wave respawns

#include "macros.hpp"

params ["_corpse", "_killer"];

DEBUG_PRINT_LOG("[RespawnWaves] Player was killed.")

LOCAL_ONLY(_corpse);

f_var_playerHasBeenKilled = true;
f_var_playerOriginalGroupName = groupId (group _corpse);

[_corpse] joinSilent grpNull;
