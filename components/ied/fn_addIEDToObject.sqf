/*
	Created By: JC
*/
#include "macros.hpp"

SERVER_ONLY;

params ["_object", "_isLarge", "_isProxy", "_proxySide", "_proxyRange"];

[_object, _isLarge] remoteExecCall ["f_fnc_addDefuseActionsToObject"];

_object addEventHandler ["Killed", 
{
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	
	[_unit, _unit getVariable "isLargeIED"] call f_fnc_iedBoom;
}];

_object setVariable ["isIED", true];
_object setVariable ["isLargeIED", _isLarge];

if (_isProxy) then 
{
	[_object, _isLarge, _proxySide, _proxyRange] call f_fnc_addProxyFuseTriggerToIED;
};