
#include "macros.hpp"

DEBUG_PRINT_LOG("initting shared misc")

if (isServer) then
{
    [] spawn f_fnc_monitorHeadlessClients;
};

waitUntil
{
    _settingsReady = false;

    if (IS_CLIENT) then
    {
        _settingsReady = _settingsReady or {IS_TRUE(f_var_frameworkSettingsReady_client)};
    };

    if (isServer) then
    {
        _settingsReady = _settingsReady or {IS_TRUE(f_var_frameworkSettingsReady_server)};
    };

    (_settingsReady and {IS_TRUE(ace_common_settingsInitFinished)})
};

DEBUG_PRINT_LOG("Framework settings initialised and ace_common_settingsInitFinished is true: setting f_var_allSettingsReady to true.")
f_var_allSettingsReady = true;
