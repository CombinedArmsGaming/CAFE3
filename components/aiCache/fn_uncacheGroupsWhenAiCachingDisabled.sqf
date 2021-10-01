#include "macros.hpp"

// Wait until AI caching is disabled, then uncache all cached groups.

SERVER_ONLY;
RUN_AS_ASYNC(f_fnc_uncacheGroupsWhenAiCachingDisabled);

waitUntil
{
    sleep f_var_cacheSleep;
    (f_param_caching == 0)
};

DEBUG_PRINT_CHAT("[AICACHE-2]: Uncaching all groups because f_param_caching == 0.")

f_fnc_uncacheAllCachedGroups call CBA_fnc_directCall;
