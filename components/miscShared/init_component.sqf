
#include "macros.hpp"

DEBUG_PRINT_LOG("initting shared misc")

if (isServer) then
{
    [] spawn f_fnc_monitorHeadlessClients;
};

// For now, "all settings" only includes ACE.
waitUntil
{
    IS_TRUE(ace_common_settingsInitFinished)
};

DEBUG_PRINT_LOG("ace_common_settingsInitFinished is true, setting f_var_allSettingsReady to true.")
f_var_allSettingsReady = true;
