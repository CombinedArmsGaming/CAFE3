/*
	Created By: JC
*/

// TODO On dedi server, verify that others can set it off
params ["_object", "_isLarge", "_isProxy", "_proxySide", "_proxyRange"];

[_object, _isLarge] call f_fnc_addDefuseActionsToObject;
[_object, _isLarge] call f_fnc_addZeusDetonationToIED;

_object setVariable ["isIED", true];

if (_isProxy) then 
{
	[_object, _isLarge, _proxySide, _proxyRange] call f_fnc_addProxyFuseTriggerToIED;
};