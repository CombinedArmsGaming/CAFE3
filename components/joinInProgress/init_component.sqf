#include "macros.hpp"

DEBUG_PRINT_LOG("initting joinInProgress")

waitUntil {local player};

if (hasInterface and didJIP) then
{
    player setVariable ["f_var_mayTeleportToGroup", true, true];
};
