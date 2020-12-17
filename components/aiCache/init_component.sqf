#include "macros.hpp"

SERVER_ONLY;

DEBUG_PRINT_LOG("[AICACHE-2]: initting ai cache new")

// Check whether the paramater is defined (or caching switched off)) - if not, just exit
if (isNil "f_param_caching" || {f_param_caching == 0}) exitWith {};

// Wait for the mission to have launched before starting to cache.
WAIT_UNTIL_MISSION_STARTED();

// Wait up to the desired time into the mission to give AI and players time to settle
waitUntil {time > f_var_cacheWait};

DEBUG_PRINT_LOG("[AICACHE-2]: doing ai cache new")

if (isServer) then
{

    _playableGroups = playableUnits apply {group _x};
    _playableGroups = _playableGroups call BIS_fnc_consolidateArray;
    _playableGroups = _playableGroups apply {_x select 0};

    {
        _x setVariable ["f_cacheExcl", true, true];

    } forEach _playableGroups;

    f_arr_civPopModules = allMissionObjects "ModuleCivilianPresence_F";

    f_handle_aiCache = [] spawn
    {
        waitUntil
        {
            [] call f_fnc_excludePlayerGroupsFromCache;
            [] call f_fnc_updatePlayerClusters;
            [] call f_fnc_doAiCacheIteration;
            [] call f_fnc_doCivPopCacheIteration;

#ifdef ENABLE_DEBUG
            [] call f_fnc_displayClusters;
#endif

            sleep f_var_cacheSleep;
			false

        };

    };

    [] spawn
    {
        waitUntil
        {
            scriptDone f_handle_aiCache
        };

        // If the caching loop is terminated, uncache all cached groups
        {
            if (_x getvariable ["f_cached", false]) then
            {
                _x spawn f_fnc_uncacheGroup;
            };

        } forEach allGroups;

    };

    DEBUG_PRINT_LOG("[AICACHE-2]: spawned both loops")

    _shouldUncacheNearZeus = ((f_var_uncacheWhenNear isEqualTo PLAYERS_AND_ZEUS) or {f_var_uncacheWhenNear isEqualTo PLAYERS_AND_DRONES_AND_ZEUS});
    missionNamespace setVariable ["f_var_uncacheNearZeus", _shouldUncacheNearZeus, true];

    _shouldUncacheNearDrone = ((f_var_uncacheWhenNear isEqualTo PLAYERS_AND_DRONES) or {f_var_uncacheWhenNear isEqualTo PLAYERS_AND_DRONES_AND_ZEUS});
    missionNamespace setVariable ["f_var_uncacheNearDrones", _shouldUncacheNearDrone, true];

};
