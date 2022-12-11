#include "macros.hpp"

DEBUG_PRINT_LOG("initting joinInProgress")

#ifdef ALLOW_TELEPORT_UPON_JIP

waitUntil {local player};

if (hasInterface and didJIP) then
{
    player setVariable ["f_var_mayTeleportToGroup", true, true];
};

#endif