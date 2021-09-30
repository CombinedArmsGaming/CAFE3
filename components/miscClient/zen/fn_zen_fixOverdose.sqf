#include "../macros.hpp"

CLIENT_ONLY;

params ["_unit"];

if ((isNull _unit) or {!(_unit isKindOf "CAManBase")}) exitWith
{
    ["Only players or AI can be detoxed."] call zen_common_fnc_showMessage;
};

if !(alive _unit) exitWith
{
    ["%1 must be alive in order to be detoxed.", name _unit] call zen_common_fnc_showMessage;
};

["Purging drugs from %1.  They may still require medical attention.", name _unit] call zen_common_fnc_showMessage;

[_unit] remoteExec ["f_fnc_fixOverdose", _unit];
