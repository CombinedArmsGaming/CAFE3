// CA respawn system with wave respawns

#include "macros.hpp"

params ["_corpse", "_killer"];

DEBUG_PRINT_LOG("[RespawnWaves] Player was killed.")

CLIENT_ONLY;
LOCAL_ONLY(_corpse);

#include "..\parts\zeusAdditions_onKilled.sqf"

f_var_playerHasBeenKilled = true;
