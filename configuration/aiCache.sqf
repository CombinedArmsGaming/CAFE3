#include "internals\configAliases.hpp"

// Define parameters

// The range outside of which to cache units, in metres.
f_param_caching = 1000;

// The caching mode to use.  Options are:
// AI_CACHE_ALL,
// AI_CACHE_EXCEPT_DRIVERS,
// AI_CACHE_EXCEPT_LEADERS_AND_DRIVERS
// AI_CACHE_EXCEPT_CREW
// AI_CACHE_EXCEPT_LEADERS_AND_CREW
f_var_cachingAggressiveness = AI_CACHE_EXCEPT_LEADERS_AND_CREW;

// The interval between caching runs, in seconds.  Lower intervals are useful for aircraft missions, but hits performance.
f_var_cacheSleep = 5;

// Time to wait after the mission starts until AI caching begins.
f_var_cacheWait = 10;

f_var_aiCaching_clusterRadius = 66;
