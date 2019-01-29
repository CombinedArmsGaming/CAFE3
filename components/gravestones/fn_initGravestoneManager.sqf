#include "macros.hpp"

#define CACHE f_arr_gravestoneCache
CACHE = [];

#define VIP_CACHE f_arr_gravestoneCachePriority
VIP_CACHE = [];


waitUntil
{
    _corpseCount = count CACHE + count VIP_CACHE;

    if (_corpseCount <= MAX_CORPSES_BEFORE_GRAVESTONES) exitWith {};
    if (MAX_CORPSES_BEFORE_GRAVESTONES <= 0) exitWith {};

    while {_corpseCount > MAX_CORPSES_BEFORE_GRAVESTONES} do
    {
        _cacheToUse = if (count CACHE > 0) then {CACHE} else {VIP_CACHE};

        _corpseEntry = _cacheToUse select 0;
        _corpseDeathTime = _corpseEntry select 0;
        _corpse = _corpseEntry select 1;

        _corpseTimeout = if (_corpseCount <= MAX_CORPSES_PANIC_MODE) then {GRAVESTONE_CORPSE_TIMEOUT} else {0};

        _eligibleDeathTime = time - _corpseTimeout;
        _corpseOldEnough = (_corpseDeathTime <= _eligibleDeathTime);

        if (_corpseOldEnough) then
        {
            _corpseEntry call f_fnc_createGravestoneAndDeleteCorpse;

            _cacheToUse deleteAt 0;
            _corpseCount = _corpseCount - 1;

        };
        // "else break", except SQF is bad.
        // We break the loop here because the cache lists are in ascending chronological order.
        if !(_corpseOldEnough) exitWith {};

    };

    sleep GRAVESTONE_MANAGER_INTERVAL;

};


waitUntil
{
    [] call _mainLoopBody;

}
