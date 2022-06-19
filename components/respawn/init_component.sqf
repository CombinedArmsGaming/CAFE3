#include "macros.hpp"

DEBUG_PRINT_LOG("initting respawn")

if (isServer) then
{
    #ifdef RESPAWN_SIDE_TICKETS_BLUFOR
    [west, RESPAWN_SIDE_TICKETS_BLUFOR] call BIS_fnc_respawnTickets;
    #endif
    
    #ifdef RESPAWN_SIDE_TICKETS_OPFOR
    [east, RESPAWN_SIDE_TICKETS_OPFOR] call BIS_fnc_respawnTickets;
    #endif    
    
    #ifdef RESPAWN_SIDE_TICKETS_INDFOR
    [independent, RESPAWN_SIDE_TICKETS_INDFOR] call BIS_fnc_respawnTickets;
    #endif    
    
    #ifdef RESPAWN_SIDE_TICKETS_CIVILIAN
    [civilian, RESPAWN_SIDE_TICKETS_CIVILIAN] call BIS_fnc_respawnTickets;
    #endif


    #ifdef RESPAWN_DELAY_BLUFOR
    f_var_respawnDelay_blufor = RESPAWN_DELAY_BLUFOR;
    #else
    f_var_respawnDelay_blufor = 0;
    #endif
    
    #ifdef RESPAWN_DELAY_OPFOR
    f_var_respawnDelay_opfor = RESPAWN_DELAY_OPFOR;
    #else
    f_var_respawnDelay_opfor = 0;
    #endif    
    
    #ifdef RESPAWN_DELAY_INDFOR
    f_var_respawnDelay_indfor = RESPAWN_DELAY_INDFOR;
    #else
    f_var_respawnDelay_indfor = 0;
    #endif   
    
    #ifdef RESPAWN_DELAY_CIVILIAN
    f_var_respawnDelay_civilian = RESPAWN_DELAY_CIVILIAN;
    #else
    f_var_respawnDelay_civilian = 0;
    #endif


    #ifdef RESPAWN_WAVE_DURATION
    f_var_respawnDuration = RESPAWN_WAVE_DURATION;
    #else
    f_var_respawnDuration = 0;
    #endif

};

if (hasInterface) then
{
    #ifdef RESPAWN_PLAYER_TICKETS_BLUFOR

    if (playerSide isEqualTo west) then
    {
        [player, RESPAWN_PLAYER_TICKETS_BLUFOR] call BIS_fnc_respawnTickets;
    };

    #endif

    
    #ifdef RESPAWN_PLAYER_TICKETS_OPFOR

    if (playerSide isEqualTo east) then
    {
        [player, RESPAWN_PLAYER_TICKETS_OPFOR] call BIS_fnc_respawnTickets;
    };

    #endif
    
    
    #ifdef RESPAWN_PLAYER_TICKETS_INDFOR

    if (playerSide isEqualTo independent) then
    {
        [player, RESPAWN_PLAYER_TICKETS_INDFOR] call BIS_fnc_respawnTickets;
    };

    #endif
    
    
    #ifdef RESPAWN_PLAYER_TICKETS_CIVILIAN

    if (playerSide isEqualTo civilian) then
    {
        [player, RESPAWN_PLAYER_TICKETS_CIVILIAN] call BIS_fnc_respawnTickets;
    };

    #endif


    // Keep updating player side in a var case selectPlayer or rating loss causes playerSide != side player.
    f_fnc_updatePlayerSideVar = 
    {
        player setVariable ["f_var_playerSide", playerSide, true];

        [
            // Script
            f_fnc_updatePlayerSideVar,
        
            // Arguments
            [],
        
            // Delay (secs)
            5
        
        ] call CBA_fnc_waitAndExecute;
    };

    [] call f_fnc_updatePlayerSideVar;


    f_fnc_updateCanUseRespawnMenu =
	{
        private _canRespawn = 
            ((leader group player) isEqualTo player) or
            {serverCommandAvailable '#kick'} or
            {player getVariable ["f_var_isZeus", false]};

        player setVariable ["f_var_canUseRespawnMenu", _canRespawn];

        [
            // Script
            f_fnc_updateCanUseRespawnMenu,
        
            // Arguments
            [],
        
            // Delay (secs)
            5
        
        ] call CBA_fnc_waitAndExecute;
	};
    
    [] call f_fnc_updateCanUseRespawnMenu;

};
