#include "..\startup\configuration\internals\configAliases.hpp"

// Define parameters

// The range outside of which to cache units, in metres.
f_param_caching = 1000;


// The range for caching civilian presence modules.
// Civilians spawn at a rate of 1 per second, if you have high-population cities you should make this radius a little larger to compensate for spawn delay.
f_param_caching_civpop = 1000;


// The caching mode to use.  Options are:
// AI_CACHE_ALL,
// AI_CACHE_EXCEPT_DRIVERS,
// AI_CACHE_EXCEPT_LEADERS_AND_DRIVERS
// AI_CACHE_EXCEPT_CREW
// AI_CACHE_EXCEPT_LEADERS_AND_CREW
f_var_cachingAggressiveness = AI_CACHE_EXCEPT_LEADERS_AND_CREW;


// AI will un-cache when near the units chosen below.  Options are:
// PLAYERS_ONLY,
// PLAYERS_AND_ZEUS,
// PLAYERS_AND_DRONES,
// PLAYERS_AND_DRONES_AND_ZEUS,
f_var_uncacheWhenNear = PLAYERS_AND_ZEUS;


// The interval between caching runs, in seconds.
// Lower intervals will improve accuracy (useful for missions with very fast vehicles such as jets), but very low intervals will hurt server performance.
f_var_cacheSleep = 5;


// Time to wait after the mission starts until AI caching begins.
// If you have a lot of heavy scripts running at the start of a mission, this can help to smooth desync out over a longer period.
f_var_cacheWait = 10;

// If players are closer together than this, they will be grouped together for optimisation.
// Larger numbers allow for greater optimisation, but makes the caching range less accurate (see f_param_caching).
f_var_aiCaching_clusterRadius = 66;
