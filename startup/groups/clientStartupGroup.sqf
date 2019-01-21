// Client startup group
// Executes all scripts needed by a normal client.

#include "macros.hpp"

// 	F3 - Fireteam Member Markers
// 	Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
INIT_COMPONENT(ftMemberMarkers)

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
INIT_COMPONENT(briefing)

// F3 - Safe start
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
INIT_COMPONENT(safeStart)

// F3 - AI Caching
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
INIT_COMPONENT(aiCache)

// F3 - Radio Systems Support
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
INIT_COMPONENT(radios)

INIT_COMPONENT(miscClient)

INIT_COMPONENT(respawnWaves)

INIT_COMPONENT(zeusAdditions)


// Gravestones init
#ifdef ENABLE_GRAVESTONE_CORPSE_MANAGER

INIT_COMPONENT(gravestones)

#endif
