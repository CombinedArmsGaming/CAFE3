/* --------------------------------------------------------------------------------------------------------------------
	Author:		Cre8or
	Description:
		Monitors the provided gravestone object for inventory access. When opened, this function request a locality
		transfer of the object, from the server to the local machine (see fn_requestGravestoneLocality).
		Fixes issue #226.
		While intended for gravestone objects, this function can aslo be used on any transferrable object.

		This function can only be executed on client machines.
	Arguments:
		0:  <BOOLEAN>   The gravestone object to monitor
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

params [
	["_obj", objNull, [objNull]]
];

if (isServer or {isNull _obj}) exitWith {};





// Remove the previous event handler, if there is one
private _EH = _obj getVariable ["f_fnc_monitorGravestoneAccess_EH", -1];
_obj removeEventHandler ["ContainerOpened", _EH];

_obj addEventHandler ["ContainerOpened", {
	params ["_obj"];

	// Optimisation: only send requests if the gravestone is still local to the server
	// (minimise network traffic).
	// We can't check "local" or "owner" here because the crate might be local to another
	// client, and only the server has access to ownership data, so we rely on a custom
	// variable instead.
	if !(_obj getVariable ["f_fnc_requestGravestoneLocality_isOnServer", true]) exitWith {
	};

	[_obj, clientOwner] remoteExecCall ["f_fnc_requestGravestoneLocality", 2, false];
}];
_obj setVariable ["f_fnc_monitorGravestoneAccess_EH", _EH, false];
