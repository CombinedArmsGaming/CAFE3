// F3 - Caching Script Init
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

#include "macros.hpp"

// Make sure script is only run once
if (missionNameSpace getVariable ["f_var_aiCacheInitialized", false]) exitWith {};
f_var_aiCacheInitialized = true;

// ====================================================================================

// All groups with playable units are set to be ignored as well
{
	if ({_x in playableUnits} count units _x > 0) then
    {
        _x setVariable ["f_cacheExcl", true, true];
    };

} forEach allGroups;

f_var_cacheRun = true;

[] spawn f_fnc_cacheTracker;


DEBUG_FORMAT3_LOG("f_fnc_cInit DBG: Starting to track %1 groups, %2 range, %3 sleep",count allGroups,f_param_caching,f_var_cacheSleep)
