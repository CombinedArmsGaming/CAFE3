// Client startup group
// Executes all scripts needed by a normal client.

#include "macros.hpp"

// 	CAFE - Fireteam Member Markers
// 	Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
//LOAD_GLOBALS(ftMemberMarkers)

LOAD_GLOBALS(squadMarkers)

// CAFE - Briefing
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
//LOAD_GLOBALS(briefing)

// CAFE - Radio Systems Support
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
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
