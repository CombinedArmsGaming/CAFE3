// Configuration aliases.
// For magic numbers and names that need explaining.

// Note: Caching aggressiveness is set using the f_var_cachingAggressiveness variable; possible values:

// 1 - cache only non-leaders and non-drivers
#define AI_CACHE_EXCEPT_LEADERS_AND_DRIVERS 1

// 2 - cache all non-moving units, always exclude vehicle drivers
#define AI_CACHE_EXCEPT_DRIVERS 2

// 3 - cache all units, incl. group leaders and vehicle drivers
#define AI_CACHE_ALL 3
