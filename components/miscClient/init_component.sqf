
#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting client misc")

[] spawn f_fnc_pmMissionIntro;

[] spawn
{
    while {true} do
    {
        [player, 7500] call f_fnc_setRating;
        sleep 5;
    };

}
