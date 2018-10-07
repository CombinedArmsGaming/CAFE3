#include "macros.hpp"

DEBUG_PRINT_LOG("initting markers")

if (hasInterface) then
{
    // MAKE SURE THE PLAYER INITIALIZES PROPERLY
    if (isNull player) then
    {
        waitUntil
        {
            uiSleep 1;
            !isNull player
        };
    };

    DEBUG_PRINT_LOG("done waiting: markers")

    [] call f_fnc_beginFireteamMarkers;
    
};
