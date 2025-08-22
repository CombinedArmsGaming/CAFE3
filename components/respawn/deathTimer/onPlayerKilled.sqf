#include "macros.hpp"

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

missionNamespace setVariable ["f_var_playerDeathTime", CBA_missionTime];
DEBUG_FORMAT1_LOG("[RESPAWN] Set player death time to %1", missionNamespace getVariable "f_var_playerDeathTime");