#include "macros.hpp"

if (isNil "f_var_logiVehicle_already_run") then
{
    #include "..\..\..\logi_macros.hpp"
    f_var_logiVehicle_already_run = true;

    #include "..\..\..\configuration\logiVehicle.sqf"
    f_var_logiVehicle_loaded = true;

}
else
{
    DEBUG_PRINT_LOG("[LOGI-VICS]: Logi vic config tried running multiple times.")
};
