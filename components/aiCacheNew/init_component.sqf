#include "macros.hpp"

DEBUG_PRINT_LOG("initting ai cache")

// Check whether the paramater is defined (or caching switched off)) - if not, just exit
if (isNil "f_param_caching" || {f_param_caching == 0}) exitWith {};

// ====================================================================================

// Wait for the mission to have launched before starting to cache.
WAIT_UNTIL_MISSION_STARTED();

// Wait up to the desired time into the mission to give AI and players time to settle
waitUntil {time > f_var_cacheWait};

// ====================================================================================

// Player and the headless client's (if present) groups are always excluded from being cached
if (hasInterface && { !(group player getVariable ["f_cacheExcl", false]) }) then
{
    // BUB 2018-09-22 TODO :: Ensure this is set on all JIP + respawn groups.
    (group player) setVariable ["f_cacheExcl", true, true];
};

// ====================================================================================

// Rest of the Script is only run server-side
if (isServer) then
{
    // TODO :: Strict ordering may be necessary: build clusters then cache groups (unless dCluster >> dCache).
    [] spawn f_fnc_playerClusterLoop;
    [] spawn f_fnc_playerCacheExclusionLoop;

    [] spawn f_fnc_initCacher;

};
