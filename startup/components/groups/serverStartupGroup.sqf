// Client startup group
// Executes all scripts needed by a normal client.

#include "macros.hpp"

// Ceasefire
INIT_COMPONENT(ceasefire)

// CAFE - AI Caching
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
INIT_COMPONENT(aiCache)

// CAFE - Radio Systems Support
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
INIT_COMPONENT(radios)

INIT_COMPONENT(respawnWaves)

INIT_COMPONENT(miscShared)


// Kill tracker init
#ifdef ENABLE_KILL_TRACKING

INIT_COMPONENT(killTracker)

#endif


// Gravestones init
#ifdef ENABLE_GRAVESTONE_CORPSE_MANAGER

INIT_COMPONENT(gravestones)

#endif
