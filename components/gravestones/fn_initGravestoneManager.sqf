#include "macros.hpp"

#define CACHE f_arr_gravestoneCache
CACHE = [];

#define VIP_CACHE f_arr_gravestoneCachePriority
VIP_CACHE = [];


waitUntil
{
    scopeName "main";
    _corpseCount = count CACHE + count VIP_CACHE;

    if (_corpseCount <= MAX_CORPSES_BEFORE_GRAVESTONES) exitWith 
	{
		sleep GRAVESTONE_MANAGER_INTERVAL;
		false
	};

    while {_corpseCount > MAX_CORPSES_BEFORE_GRAVESTONES} do
    {
        _cacheToUse = if (count CACHE > 0) then {CACHE} else {VIP_CACHE};

        _corpseEntry = _cacheToUse select 0;
        _corpseDeathTime = _corpseEntry select 0;
        _netId = _corpseEntry select 1;

        _corpse = _netId call BIS_fnc_objectFromNetId;

        if !(isNull _corpse) then
        {
            _corpseTimeout = if (_corpseCount <= MAX_CORPSES_PANIC_MODE) then {GRAVESTONE_CORPSE_TIMEOUT} else {0};

            _eligibleDeathTime = time - _corpseTimeout;
            _corpseOldEnough = (_corpseDeathTime <= _eligibleDeathTime);

            if (_corpseOldEnough) then
            {
                _corpseEntry set [1, _corpse];
                _corpseEntry call f_fnc_createGravestoneAndDeleteCorpse;

                _cacheToUse deleteAt 0;
                _corpseCount = _corpseCount - 1;
            }
            else
            {
                breakTo "main";
            };

        }
        else
        {
            _cacheToUse deleteAt 0;
            _corpseCount = _corpseCount - 1;
        };

    };

    sleep GRAVESTONE_MANAGER_INTERVAL;
	false

};

