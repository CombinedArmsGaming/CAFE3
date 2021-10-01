#include "macros.hpp"

// Uncache all currently cached groups.

SERVER_ONLY;

{
    if (_x getVariable ["f_cached", false]) then
    {
        _x spawn f_fnc_uncacheGroup;
    };

} forEach allGroups;
