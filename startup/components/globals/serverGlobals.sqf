// Client startup group
// Executes all scripts needed by a normal client.

#include "macros.hpp"

// F3 - Safe start
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//LOAD_GLOBALS(safeStart)

// F3 - AI Caching
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//LOAD_GLOBALS(aiCache)

// F3 - Radio Systems Support
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
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
