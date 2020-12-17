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


// Note: Units considered for decaching clusters are set using the f_var_uncacheWhenNear variable; possible values:

// 1 - uncache only when near regular players
#define PLAYERS_ONLY 1

// 2 - uncache when near regular players or zeuses
#define PLAYERS_AND_ZEUS 2

// 3 - uncache when near players or *connected* drones
#define PLAYERS_AND_DRONES 3

// 4 - uncache when near regular players, zeuses or *connected* drones
#define PLAYERS_AND_DRONES_AND_ZEUS 4
