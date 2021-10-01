#include "macros.hpp"

if (isNil "f_var_identity_already_run") then
{
    #include "..\..\..\identity_macros.hpp"
    f_var_identity_already_run = true;

    #include "..\..\..\configuration\identities\identityGroups.sqf"
    #include "..\..\..\configuration\identities\identityAssignment.sqf"

    f_var_identity_loaded = true;
}
else
{
    DEBUG_PRINT_LOG("[IDENTITY]: Identity translation tried running multiple times.")
};