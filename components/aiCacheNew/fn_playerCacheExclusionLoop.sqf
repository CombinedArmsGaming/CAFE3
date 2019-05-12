
#include "macros.hpp"

SERVER_ONLY;

_excludePlayerGroupsFromCache =
{
    _groups = allGroups;

    {
        _hasPlayer = ((units _x) findIf {isPlayer _x} >= 0);

        if (_hasPlayer) then
        {
            _x setVariable ["f_cacheExcl", true, true];
        };

    } forEach _groups;

}

[] spawn
{
    waitUntil
    {
        [] call _excludePlayerGroupsFromCache;
        sleep 5;
    };

};
