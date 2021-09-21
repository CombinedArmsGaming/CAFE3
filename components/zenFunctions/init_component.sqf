#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting zenFunctions")

if !(isNil 'zen_custom_modules_fnc_register') then
{
    #include "..\zen_modules.sqf"
};
