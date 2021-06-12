#include "macros.hpp"

if (isNil "f_var_lootbox_already_run") then
{
    #include "..\..\..\lootbox_macros.hpp"
    f_var_lootbox_already_run = true;

    #include "..\..\..\configuration\lootBox.sqf"
    f_var_lootbox_loaded = true;

}
else
{
    DEBUG_PRINT_LOG("[LOOTBOX]: Lootbox tried running multiple times.")
};
