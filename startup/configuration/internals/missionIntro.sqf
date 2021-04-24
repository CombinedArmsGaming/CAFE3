#include "macros.hpp"

if (isNil "f_var_missionIntro_already_run") then
{
    #include "..\..\..\missionIntro_macros.hpp"
    f_var_missionIntro_already_run = true;

    #include "..\..\..\configuration\missionIntro.sqf"
    f_var_missionIntro_loaded = true;

}
else
{
    DEBUG_PRINT_LOG("[MISSION-INTRO]: MissionIntro config tried running multiple times.")
};
