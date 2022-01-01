// Client startup group
// Executes all scripts needed by a normal client.

#include "macros.hpp"

// CAFE - AI Caching
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
//LOAD_GLOBALS(aiCache)

// CAFE - Radio Systems Support
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
//LOAD_GLOBALS(radios)

//LOAD_GLOBALS(respawnWaves)

LOAD_GLOBALS(miscShared)


// Kill tracker init
#ifdef ENABLE_KILL_TRACKING

//LOAD_GLOBALS(killTracker)

#endif


// Gravestones init
#ifdef ENABLE_GRAVESTONE_CORPSE_MANAGER

//LOAD_GLOBALS(gravestones)

#endif
