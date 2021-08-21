// Client startup group
// Executes all scripts needed by a normal client.

#include "macros.hpp"

// 	F3 - Fireteam Member Markers
// 	Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//LOAD_GLOBALS(ftMemberMarkers)

LOAD_GLOBALS(squadMarkers)

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//LOAD_GLOBALS(briefing)

// F3 - Safe start
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//LOAD_GLOBALS(safeStart)

// F3 - Radio Systems Support
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//LOAD_GLOBALS(radios)

//LOAD_GLOBALS(miscClient)

LOAD_GLOBALS(miscShared)

//LOAD_GLOBALS(respawnWaves)

//LOAD_GLOBALS(zeus_ui)

//LOAD_GLOBALS(downtime)

//LOAD_GLOBALS(zenFunctions)


// Gravestones init
#ifdef ENABLE_GRAVESTONE_CORPSE_MANAGER

//LOAD_GLOBALS(gravestones)

#endif


// View distance editor
#ifdef ENABLE_VIEWDISTANCE_EDITOR

//LOAD_GLOBALS(viewDistanceEditor)

#endif
