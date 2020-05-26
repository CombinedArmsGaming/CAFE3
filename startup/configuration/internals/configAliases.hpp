// Configuration aliases.
// For magic numbers and names that need explaining.

// Note: Caching aggressiveness is set using the f_var_cachingAggressiveness variable; possible values:

// 1 - cache only non-leaders and non-drivers
#define AI_CACHE_EXCEPT_LEADERS_AND_DRIVERS 1

// 2 - cache all units, always exclude vehicle drivers
#define AI_CACHE_EXCEPT_DRIVERS 2

// 3 - cache all units, incl. group leaders and vehicle drivers
#define AI_CACHE_ALL 3

// 4 - cache all units, always exclude vehicle crews.
#define AI_CACHE_EXCEPT_CREW 4

// 5 - cache all units, always exclude vehicle crews and leaders.
#define AI_CACHE_EXCEPT_LEADERS_AND_CREW 5
