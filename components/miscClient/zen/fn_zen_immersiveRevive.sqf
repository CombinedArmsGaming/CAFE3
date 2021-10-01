#include "../macros.hpp"
#define IS_UNCONSCIOUS(UNIT) (((UNIT) getVariable ["ACE_isUnconscious", false]) and {alive (UNIT)})

CLIENT_ONLY;

params ["_unit"];

if ((isNull _unit) or {!(_unit isKindOf "CAManBase")}) exitWith
{
    ["Only players or AI can be revived."] call zen_common_fnc_showMessage;
};

if !IS_UNCONSCIOUS(_unit) exitWith
{
    ["%1 must be unconscious in order to be revived.", name _unit] call zen_common_fnc_showMessage;
};

["Attempting to revive %1...", name _unit] call zen_common_fnc_showMessage;

[_unit] remoteExec ["f_fnc_immersiveRevive", _unit];
