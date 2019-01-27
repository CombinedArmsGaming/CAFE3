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

// Define parameters
_range = f_param_caching;	// The range outside of which to cache units
f_var_cacheRun = true;

[_range] spawn f_fnc_cacheTracker;


#ifdef ENABLE_DEBUG

DEBUG_FORMAT3_LOG("f_fnc_cInit DBG: Starting to track %1 groups, %2 range, %3 sleep",count allGroups,_range,f_var_cacheSleep)

/* [] spawn
{
   // Giving the tracker a head start
   sleep (f_var_cacheSleep * 1.1);

   while {f_var_cacheRun} do
   {
		_str1 = "f_fnc_initCacher DBG: [";
		_str2 = format ["Total groups: %1, ", count allGroups];
		_str3 = format ["Cached groups: %1, ", {_x getvariable "f_cached"} count allGroups];
		_str4 = format ["Activated groups: %1, ", {!(_x getvariable "f_cached")} count allGroups];
		_str5 = format ["Excluded groups :%1]", {(_x getvariable "f_cacheExcl")} count allGroups];

        _debugLine = _str1+_str2+_str3+_str4+_str5;
		DEBUG_PRINT_LOG(_debugLine);

		sleep f_var_cacheSleep;
	};

}; */

#endif
