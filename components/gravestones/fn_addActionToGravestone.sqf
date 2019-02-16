#include "macros.hpp"

params ["_grave", "_unitName", "_deathTime", "_obituary"];

DEBUG_FORMAT1_LOG("[Gravestones] Received gravestone %1, adding actions...",_grave)

_parent = objectParent _grave;

if (!isNull _parent and {_parent isKindOf "WeaponHolderSimulated" or _parent isKindOf "GroundWeaponHolder"}) then
{
    DEBUG_FORMAT1_LOG("[Gravestones] Gravestone parent was a weapon holder, using %1 instead...",_parent)
    _grave = _parent;
};

_grave setVariable ["UnitWithin", _unitName];
_grave setVariable ["UnitDeathTime", _deathTime];
_grave setVariable ["UnitObituary", _obituary];

[_grave, 0, ["ACE_MainActions"], f_var_readGravestoneAction] call ace_interact_menu_fnc_addActionToObject;
[_grave, 0, ["ACE_MainActions"], f_var_deleteGravestoneAction] call ace_interact_menu_fnc_addActionToObject;
