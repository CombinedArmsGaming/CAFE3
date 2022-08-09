#include "macros.hpp"

f_var_respawnDelay_blufor = RESPAWN_DELAY_BLUFOR;
f_var_respawnDelay_opfor = RESPAWN_DELAY_OPFOR;
f_var_respawnDelay_indfor = RESPAWN_DELAY_INDFOR;
f_var_respawnDelay_civ = RESPAWN_DELAY_CIVILIAN;

// Format of entries should be "string location ID" : ["string location ID", <actual location>, <respawn target>, <respawn ID>]
f_var_respawnLocationsMap = createHashMap;