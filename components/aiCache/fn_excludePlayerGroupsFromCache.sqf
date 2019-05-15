
#include "macros.hpp"

SERVER_ONLY;

{
    _hasPlayer = ((units _x) findIf {isPlayer _x} >= 0);

    if (_hasPlayer) then
    {
        _x setVariable ["f_cacheExcl", true, true];
    };

} forEach allGroups;
