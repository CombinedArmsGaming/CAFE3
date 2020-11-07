#include "macros.hpp"

if (isNil "f_var_gearscript_already_run") then
{
    #include "..\..\..\gearscript_macros.hpp"
    f_var_gearscript_already_run = true;

    #include "..\..\..\configuration\gearScript.sqf"
    f_var_gearscript_loaded = true;

}
else
{
    DEBUG_PRINT_LOG("[GEARSCRIPT-2]: Gearscript tried running multiple times.")
};
