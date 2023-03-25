#include "macros.hpp"

if (isNil "f_var_radio_already_run") then
{
    f_var_radio_already_run = true;

    #include "..\..\..\components\radio\acre\configuration\acre_preConfiguration.sqf"
    #include "..\..\..\configuration\acre_radio_configuration.sqf"
    #include "..\..\..\components\radio\acre\configuration\acre_postConfiguration.sqf"

    f_var_radio_loaded = true;

}
else
{
    DEBUG_PRINT_LOG("[RADIO-2]: Radio config tried running multiple times.")
};
