#include "..\respawn_macros.hpp"

/*

    Respawn waves configuration.

    Available commands:
    -------------------

    SET_RESPAWN_MODE(SIDE,MODE)
    Configure how players are respawned.  Available modes:

        RESPAWN_MODE_DISABLED  - Respawn waves are not available for this side.
        RESPAWN_MODE_BASE      - Players will respawn at a marker named "respawn_SIDE", or an object named "respawner_SIDE".  Replace "SIDE" with "west", "east", "guer" or "civ".
        RESPAWN_MODE_COMMANDER - Players will respawn at the location of whoever activated the wave.  If applicable, the players will spawn in the activator's vehicle.

    SET_RESPAWN_WAVES(SIDE,WAVES)
    Amount of usable respawn waves before no more players can be respawned for the given side.

    SET_RESPAWN_MESSAGE(SIDE,"message")
    A message that will be visible to all players of the given side whenever a respawn wave is activated.

    SET_RESPAWN_WAVE_DURATION(SIDE,SECONDS)
    The duration of a respawn wave - if any players on this side die during the wave, they will be instantly respawned.

    SET_RESPAWN_WAVE_COOLDOWN(SIDE,SECONDS)
    The minimum duration between a side's respawn waves - this is counted between the end of the last wave and the start of the next wave.

    SET_RESPAWN_SQUAD_MODE(SIDE,MODE)
    Configure how respawned players join squads.  Available modes:

        RESPAWN_REJOIN_OLD_SQUAD         - Respawned players will rejoin their old squad, even if it has been totally wiped out.
        RESPAWN_JOIN_REINFORCEMENT_SQUAD - Respawned players will join a new reinforcement squad, as defined by SET_RESPAWN_WAVE_SQUADS.

    SET_RESPAWN_WAVE_SQUADS(SIDE,SQUADS)
    Sets a list of squad names that reinforcements will be placed into.  Each squad name will be used in list-order.
    If squad names run out, all future reinforcements will be placed in a default reinforcement squad.
    For squad members to rejoin their squads, they can either meet-up or use the JIP menu (ensure that 'f_var_RespawnTeleport = true;' inside respawn.sqf).

    SET_RESPAWN_WAVE_READY(SIDE,READY)
    Sets whether the respawn wave starts ready-to-use or not.  If you set this to false, respawn waves will not be usable.
    This might have some niche uses but you should probably use SET_RESPAWN_MODE instead.

    COPY_RESPAWN_CONFIG(TO_SIDE,FROM_SIDE);
    Use this command to copy respawn details from one side to another side.  You will still need to manually place the "respawn_SIDE" marker or the "respawner_SIDE" object.

*/



// BLUFOR config.
SET_RESPAWN_MODE(west,RESPAWN_MODE_BASE);
SET_RESPAWN_SQUAD_MODE(west,RESPAWN_REJOIN_OLD_SQUAD);
SET_RESPAWN_WAVES(west,5);
SET_RESPAWN_WAVE_DURATION(west,60);
SET_RESPAWN_WAVE_COOLDOWN(west,300);
SET_RESPAWN_WAVE_READY(west,true);

// Important: Place anything with a comma inside it into a separate line.  This is a technical limitation.
_squads = ["DELTA","ECHO","FOXTROT","GOLF","HOTEL"];
SET_RESPAWN_WAVE_SQUADS(west,_squads);

_message = "Reinforcements have arrived.";
SET_RESPAWN_MESSAGE(west,_message);




// OPFOR config.
COPY_RESPAWN_CONFIG(east,west);

// INDFOR config.
COPY_RESPAWN_CONFIG(independent,west);

// Civilian config.
COPY_RESPAWN_CONFIG(civilian,west);
