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
};

if (hasInterface) then
{
    #ifdef RESPAWN_PLAYER_TICKETS_BLUFOR

    if (playerSide isEqualTo west) then
    {
        [west, RESPAWN_PLAYER_TICKETS_BLUFOR] call BIS_fnc_respawnTickets;
    };

    #endif

    
    #ifdef RESPAWN_PLAYER_TICKETS_OPFOR

    if (playerSide isEqualTo east) then
    {
        [east, RESPAWN_PLAYER_TICKETS_OPFOR] call BIS_fnc_respawnTickets;
    };

    #endif
    
    
    #ifdef RESPAWN_PLAYER_TICKETS_INDFOR

    if (playerSide isEqualTo independent) then
    {
        [independent, RESPAWN_PLAYER_TICKETS_INDFOR] call BIS_fnc_respawnTickets;
    };

    #endif
    
    
    #ifdef RESPAWN_PLAYER_TICKETS_CIVILIAN

    if (playerSide isEqualTo civilian) then
    {
        [civilian, RESPAWN_PLAYER_TICKETS_CIVILIAN] call BIS_fnc_respawnTickets;
    };

    #endif

};
