#include "../macros.hpp"

CLIENT_ONLY;

params ["_unit"];

if ((isNull _unit) or {!(_unit isKindOf "CAManBase")}) exitWith
{
    ["Only players or AI can be healed."] call zen_common_fnc_showMessage;
};

if !(alive _unit) exitWith
{
    ["%1 must be alive in order to be healed.", name _unit] call zen_common_fnc_showMessage;
};

["Healing up to 20 wounds on %1.  Repeat if still wounded afterwards.", name _unit] call zen_common_fnc_showMessage;

[_unit, 20] remoteExec ["f_fnc_healWounds", _unit];
