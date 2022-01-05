#include "../macros.hpp"

CLIENT_ONLY;

params ["_unit"];

if ((isNull _unit) or {!(_unit isKindOf "CAManBase")} or (isPlayer _unit)) exitWith
{
    ["No valid unit selected"] call zen_common_fnc_showMessage;
};

[_unit] remoteExecCall ["f_fnc_toggleAIPath", _unit];
