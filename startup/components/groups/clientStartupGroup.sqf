// Client startup group
// Executes all scripts needed by a normal client.

#include "macros.hpp"

INIT_COMPONENT(squadMarkers)

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
INIT_COMPONENT(briefing)

// Ceasefire
INIT_COMPONENT(ceasefire)

// F3 - Radio Systems Support
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
INIT_COMPONENT(radios)

INIT_COMPONENT(miscClient)

INIT_COMPONENT(miscShared)

INIT_COMPONENT(respawnWaves)

INIT_COMPONENT(zeus_ui)

INIT_COMPONENT(downtime)

INIT_COMPONENT(zenFunctions)


// Gravestones init
#ifdef ENABLE_GRAVESTONE_CORPSE_MANAGER

INIT_COMPONENT(gravestones)

#endif


// View distance editor
#ifdef ENABLE_VIEWDISTANCE_EDITOR

INIT_COMPONENT(viewDistanceEditor)

#endif


// Identity replacements
#ifdef ENABLE_IDENTITY_REPLACEMENT

RUN_FUNC_ONCE(f_fnc_applyExistingUnitIdentities)

#endif
