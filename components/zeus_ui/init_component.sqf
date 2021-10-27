#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting zeus_ui")

//[] spawn f_fnc_detectZeusDisplay; THIS COMMENT WILL BE DELETED ON RELEASE

waitUntil
{
    sleep 1;
    !isNull (findDisplay 312)
};

player setVariable ["f_var_isKillLogRecipient", true, true];
player setVariable ["f_var_isZeus", true, true];

[player] call f_fnc_giveUnitGodmode;

player addCuratorEditableObjects [(vehicles + allUnits), true];
player removeCuratorEditableObjects [player, true];

[] call f_fnc_addZeusActions;
