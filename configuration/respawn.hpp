#include "..\respawn_macros.hpp"

/*
    Respawn configuration.

    RESPAWN MODES:
        Set a respawn mode for each side.  They can be one of the following:

        RESPAWN_MODE_TICKETS                 - Ticket-based respawn, from whatever tickets have been configured.
        RESPAWN_MODE_TIMED                   - A respawn timer for each player individually.
        RESPAWN_MODE_TIMED_TICKETS           - Like RESPAWN_MODE_TIMED but with tickets also.
        RESPAWN_MODE_TIMED_WAVES             - A respawn timer for wave respawns.  Players will respawn at the same time at the configured interval.
        RESPAWN_MODE_TIMED_WAVES_TICKETS     - Like RESPAWN_MODE_TIMED_WAVES but with tickets also.
        RESPAWN_MODE_TRIGGERED_WAVES    	 - The classic wave system, triggered by any group leader.
        RESPAWN_MODE_TRIGGERED_WAVES_TICKETS - Like RESPAWN_MODE_TRIGGERED_WAVES, but with tickets also.

    The RESPAWN_DELAY for each side affects the modes above.  They set wave delay, individual respawn delay etc.
    In timed waves mode, the wave timer varies from 1-2x of the RESPAWN_DELAY.  In the BLUFOR example below, the timer will be between 3 to 6 minutes.

    Tickets can be given to each side, and also to players of each side.  When a player respawns, they will use their own personal tickets first before using any side tickets.

    Respawn locations can be created in the editor using the vanilla respawn system.  To affect when a respawn location is enabled/disabled, connect it to a trigger.
    Examples are placed in the default mission file.

*/

// When a player JIPs, do they get to teleport to a group of their choosing?
#define ALLOW_TELEPORT_UPON_JIP

// When a player respawns, do they get to teleport to a group of their choosing?
// #define ALLOW_TELEPORT_UPON_RESPAWN

// This only takes effect for the TRIGGERED_WAVES respawn modes.  Timed modes will use the RESPAWN_DELAY settings.
#define RESPAWN_WAVE_DURATION               60

// When 'respawnOnStart = 1' in the description.ext file, this is how long players will wait to spawn in when the mission starts.
#define INITIAL_RESPAWN_DELAY               5

// In timed waves mode, the wave timer varies from 1-2x of the RESPAWN_DELAY.  180 will mean between 3 to 6 minutes.
#define RESPAWN_MODE_BLUFOR                 RESPAWN_MODE_TIMED_WAVES_TICKETS
#define RESPAWN_DELAY_BLUFOR                180
#define RESPAWN_SIDE_TICKETS_BLUFOR         30
#define RESPAWN_PLAYER_TICKETS_BLUFOR       2
       
#define RESPAWN_MODE_OPFOR                  RESPAWN_MODE_TIMED_WAVES_TICKETS
#define RESPAWN_DELAY_OPFOR                 10
#define RESPAWN_SIDE_TICKETS_OPFOR          10
//#define RESPAWN_PLAYER_TICKETS_OPFOR      2
    
#define RESPAWN_MODE_INDFOR                 RESPAWN_MODE_TIMED_WAVES_TICKETS
#define RESPAWN_DELAY_INDFOR                RESPAWN_DELAY_BLUFOR
//#define RESPAWN_SIDE_TICKETS_INDFOR       30
//#define RESPAWN_PLAYER_TICKETS_INDFOR     2

#define RESPAWN_MODE_CIVILIAN               RESPAWN_MODE_TIMED
#define RESPAWN_DELAY_CIVILIAN              5
//#define RESPAWN_SIDE_TICKETS_CIVILIAN     30
//#define RESPAWN_PLAYER_TICKETS_CIVILIAN   2