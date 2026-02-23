#include "macros.hpp"

if (isNil "f_var_squadMarkers_already_run") then
{
    f_var_squadMarkers_already_run = true;

    [] spawn
    {
        WAIT_UNTIL_SETTINGS_READY();

        if (isServer) then
        {    
            #include "..\..\..\squadmarker_macros.hpp"

            #include "..\..\..\core_configuration\squadMarkers\squadMarkers_blufor.sqf"
            #include "..\..\..\core_configuration\squadMarkers\squadMarkers_opfor.sqf"
            #include "..\..\..\core_configuration\squadMarkers\squadMarkers_indfor.sqf"
            #include "..\..\..\core_configuration\squadMarkers\squadMarkers_civ.sqf"
            
            // List of important squads as [groupId squad, side squad]
            private _importantSquadsList = (allGroups select {SQUAD_IS_IMPORTANT(_x)}) apply {[groupId _x, side _x]};
            missionNamespace setVariable ["f_arr_importantSquadsList", _importantSquadsList, true];
        };

        f_var_squadMarkers_configLoaded = true;
    };

}
else
{
    DEBUG_PRINT_LOG("[SquadMarkers]: Squad markers tried initializing multiple times.")
};
