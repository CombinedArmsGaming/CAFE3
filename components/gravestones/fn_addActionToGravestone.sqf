#include "macros.hpp"

params ["_grave", "_unitName"];

DEBUG_FORMAT1_LOG("[Gravestones] Received gravestone %1, adding actions...",_grave)

_grave setVariable ["UnitWithin", _unitName];

[_grave, 0, ["ACE_MainActions"], f_var_gravestoneAction] call ace_interact_menu_fnc_addActionToObject;
