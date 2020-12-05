#include "macros.hpp"

if (isNil "f_var_insignia_already_defined") then
{
    f_var_insignia_already_defined = true;

    #include "..\..\..\configuration\insigniaGroups.sqf"

    f_var_insignia_defined = true;

}
else
{
    DEBUG_PRINT_LOG("[INSIGNIA]: Insignia definition tried running multiple times.")
};
