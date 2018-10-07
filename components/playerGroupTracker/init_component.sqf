#include "macros.hpp"

DEBUG_PRINT_LOG("initting player group monitor")

if (isServer) then
{
    f_arr_playerGroups = [];

    [] spawn f_fnc_playerGroupTracker;

};
