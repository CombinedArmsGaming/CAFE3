#include "..\macros.hpp"

if (isNil "f_var_squadMarkers_already_run") then
{
    #include "..\..\squadmarker_macros.hpp"
    f_var_squadMarkers_already_run = true;

    INIT_SQUADS();

    #include "squadMarkers_blufor.sqf"
    #include "squadMarkers_opfor.sqf"
    #include "squadMarkers_indfor.sqf"
    #include "squadMarkers_civ.sqf"

}
else
{
    DEBUG_PRINT_LOG("[SquadMarkers]: Squad markers tried initializing multiple times.")
};
