#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting zeusAdditions")

waitUntil
{
    sleep 1;
    !isNull (findDisplay 312)
};

[] spawn f_fnc_zeusSpawnButtons;
[] spawn f_fnc_zeusDeployment;
