#include "macros.hpp"

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

_newUnit setVariable ["f_var_playerDeathTime", CBA_missionTime];
_oldUnit setVariable ["f_var_playerDeathTime", CBA_missionTime];
DEBUG_FORMAT1_LOG("[RESPAWN] Set player death time to %1", _newUnit getVariable "f_var_playerDeathTime");