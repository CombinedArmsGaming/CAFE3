#include "macros.hpp"

params ["_grave", "_unitName", "_deathTime", "_obituary"];

DEBUG_FORMAT1_LOG("[Gravestones] Received gravestone %1, adding actions...",_grave)

_grave setVariable ["UnitWithin", _unitName];
_grave setVariable ["UnitDeathTime", _deathTime];
_grave setVariable ["UnitObituary", _obituary];

[_grave, 0, ["ACE_MainActions"], f_var_readGravestoneAction] call ace_interact_menu_fnc_addActionToObject;
[_grave, 0, ["ACE_MainActions"], f_var_deleteGravestoneAction] call ace_interact_menu_fnc_addActionToObject;
