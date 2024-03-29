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

private _woundsToHeal = 20;
["Healing up to %1 wounds on %2. Repeat if still wounded afterwards.", _woundsToHeal, name _unit] call zen_common_fnc_showMessage;

[_unit, _woundsToHeal] remoteExec ["f_fnc_healWounds", _unit];
