#include "../macros.hpp"

CLIENT_ONLY;

params ["_unit"];

if ((isNull _unit) or {!(_unit isKindOf "CAManBase")} or (isPlayer _unit)) exitWith
{
    ["No valid unit selected"] call zen_common_fnc_showMessage;
};

private _alreadyDisabled = !(_unit checkAIFeature "PATH"); 


if (_alreadyDisabled) then
{
	["Enabling AI path ability on %1.", name _unit] call zen_common_fnc_showMessage;

    [_unit, _alreadyDisabled] remoteExecCall ["f_fnc_toggleAIPath", _unit];
}
else
{
	["Disabling AI path ability on %1.", name _unit] call zen_common_fnc_showMessage;

    [_unit, _alreadyDisabled] remoteExecCall ["f_fnc_toggleAIPath", _unit];
};


