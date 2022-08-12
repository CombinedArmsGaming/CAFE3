#include "macros.hpp"

f_var_respawnDelay_blufor = RESPAWN_DELAY_BLUFOR;
f_var_respawnDelay_opfor = RESPAWN_DELAY_OPFOR;
f_var_respawnDelay_indfor = RESPAWN_DELAY_INDFOR;
f_var_respawnDelay_civ = RESPAWN_DELAY_CIVILIAN;

// Lookup of all respawn targets which the framework needs to run pollers on.  Map will be automatically managed by the respawn manager.
f_var_respawnPollersMap = createHashMap;