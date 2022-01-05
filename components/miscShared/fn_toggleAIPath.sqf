#include "macros.hpp"


params ["_unit"];

private _alreadyDisabled = !(_unit checkAIFeature "PATH");

if (_alreadyDisabled) then
{
	_unit enableAI "PATH";
	
	if (remoteExecutedOwner isNotEqualTo 0) then //Send Confirmation message to the executing machine, but only if it resolves correctly
	{
		["Enabling AI path ability on %1.", name _unit] remoteExecCall ["zen_common_fnc_showMessage", remoteExecutedOwner];
	};
}
else
{
	_unit disableAI "PATH";
	
	if (remoteExecutedOwner isNotEqualTo 0) then
	{
		["Disabling AI path ability on %1.", name _unit] remoteExecCall ["zen_common_fnc_showMessage", remoteExecutedOwner];
	};
};
