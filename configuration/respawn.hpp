#include "..\respawn_macros.hpp"


// BUB 2022-03-31 TODO: Re-introduce this functionality per-side.
// When a player respawns, do they automatically re-join their group?
//#define RESPAWN_IN_GROUP true

// BUB 2022-03-31 TODO: Re-introduce this functionality, no per-side needed.
// When a player JIPs, do they get to teleport to a group of their choosing?
// #define ALLOW_TELEPORT_UPON_JIP

// BUB 2022-03-31 TODO: Re-introduce this functionality per-side.
// When a player respawns, do they get to teleport to a group of their choosing?
// #define ALLOW_TELEPORT_UPON_RESPAWN


#define RESPAWN_MODES_BLUFOR        {RESPAWN_DEFAULTS(BLUFOR), RESPAWN_WAVE, RESPAWN_TICKETS}
#define RESPAWN_DELAY_BLUFOR        30
#define RESPAWN_AT_START_BLUFOR     1

#define RESPAWN_MODES_OPFOR         {RESPAWN_DEFAULTS(OPFOR), RESPAWN_WAVE}
#define RESPAWN_DELAY_OPFOR         10
#define RESPAWN_AT_START_OPFOR      RESPAWN_AT_START_BLUFOR

#define RESPAWN_MODES_INDFOR        {RESPAWN_DEFAULTS(INDFOR), RESPAWN_WAVE}
#define RESPAWN_DELAY_INDFOR        RESPAWN_DELAY_BLUFOR
#define RESPAWN_AT_START_INDFOR     RESPAWN_AT_START_BLUFOR

#define RESPAWN_MODES_CIVILIAN      {RESPAWN_DEFAULTS(CIVILIAN)}
#define RESPAWN_DELAY_CIVILIAN      5
#define RESPAWN_AT_START_CIVILIAN   RESPAWN_AT_START_BLUFOR