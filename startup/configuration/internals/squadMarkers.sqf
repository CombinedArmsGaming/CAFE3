#include "macros.hpp"

if (isNil "f_var_squadMarkers_already_run") then
{
    f_var_squadMarkers_already_run = true;

    [] spawn
    {
        WAIT_UNTIL_SETTINGS_READY();

        #include "..\..\..\squadmarker_macros.hpp"

        #include "..\..\..\configuration\squadMarkers\squadMarkers_blufor.sqf"
        #include "..\..\..\configuration\squadMarkers\squadMarkers_opfor.sqf"
        #include "..\..\..\configuration\squadMarkers\squadMarkers_indfor.sqf"
        #include "..\..\..\configuration\squadMarkers\squadMarkers_civ.sqf"
    };

}
else
{
    DEBUG_PRINT_LOG("[SquadMarkers]: Squad markers tried initializing multiple times.")
};
