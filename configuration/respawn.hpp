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

#define RESPAWN_MODE_BLUFOR         	    RESPAWN_MODE_TIMED
#define RESPAWN_DELAY_BLUFOR        	    30
#define RESPAWN_SIDE_TICKETS_BLUFOR		    30
#define RESPAWN_PLAYER_TICKETS_BLUFOR	    2
       
#define RESPAWN_MODE_OPFOR          	    {RESPAWN_DEFAULTS, RESPAWN_TIMED_WAVE}
#define RESPAWN_DELAY_OPFOR         	    10
#define RESPAWN_SIDE_TICKETS_OPFOR		    30
#define RESPAWN_PLAYER_TICKETS_OPFOR	    2
    
#define RESPAWN_MODE_INDFOR         	    {RESPAWN_DEFAULTS, RESPAWN_TIMED_WAVE}
#define RESPAWN_DELAY_INDFOR        	    RESPAWN_DELAY_BLUFOR
#define RESPAWN_SIDE_TICKETS_INDFOR		    30
#define RESPAWN_PLAYER_TICKETS_INDFOR	    2

#define RESPAWN_MODE_CIVILIAN       		{RESPAWN_DEFAULTS}
#define RESPAWN_DELAY_CIVILIAN      		5
#define RESPAWN_SIDE_TICKETS_CIVILIAN		30
#define RESPAWN_PLAYER_TICKETS_CIVILIAN		2