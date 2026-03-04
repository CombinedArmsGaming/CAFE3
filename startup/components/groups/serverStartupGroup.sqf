// Client startup group
// Executes all scripts needed by a normal client.

#include "macros.hpp"

// Ceasefire
INIT_COMPONENT(ceasefire)

// CAFE - AI Caching
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
INIT_COMPONENT(aiCache)

INIT_COMPONENT(miscShared)

INIT_COMPONENT(respawn)

INIT_COMPONENT(slottingGenerator)


// Kill tracker init
#ifdef ENABLE_KILL_TRACKING

INIT_COMPONENT(killTracker)

#endif


// Gravestones init
#ifdef ENABLE_GRAVESTONE_CORPSE_MANAGER

INIT_COMPONENT(gravestones)

#endif
