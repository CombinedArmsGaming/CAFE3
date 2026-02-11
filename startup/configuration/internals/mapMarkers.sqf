#include "macros.hpp"

if (isNil "f_var_mapMarkers_already_defined") then
{
    f_var_mapMarkers_already_defined = true;

    #include "..\..\..\configuration\mapMarkers.sqf"
}
else
{
    DEBUG_PRINT_LOG("[MapMarkers]: Map markers config tried running multiple times.")
};
