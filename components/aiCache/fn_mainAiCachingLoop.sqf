#include "macros.hpp"

// Perform the main loop of the AI caching module.

SERVER_ONLY;

[] call f_fnc_excludePlayerGroupsFromCache;
[] call f_fnc_updatePlayerClusters;
[] call f_fnc_doAiCacheIteration;
[] call f_fnc_doCivPopCacheIteration;

#ifdef ENABLE_DEBUG
[] call f_fnc_displayClusters;
#endif

if (f_param_caching == 0) exitWith {};
[f_fnc_mainAiCachingLoop, nil, f_var_cacheSleep] call CBA_fnc_waitAndExecute;
