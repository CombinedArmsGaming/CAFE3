/* --------------------------------------------------------------------------------------------------------------------
	Author:		Emma
	Description:
		Raises an event to add or remove a client from a notifier list
	Arguments:
		0:	<ARRAY>		Array for the list like the macros in notifier_macros.hpp
		1:	<BOOLEAN>	(optional) If the client should be removed from the list. Default: False
		1:	<NUMBER>	(optional) Amount of time before the client is auto-removed from the list. Default: -1, meaning client is not auto-removed.
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

#include "macros.hpp"

CLIENT_ONLY;

params [["_listMacro", [], [[]], 2], ["_removeFromList", false], ["_autoRemoveTime", -1]];

private _listName = _listMacro # 0;

// Keep track of how many times this client has been added to this list
// Means it is only actually removed after the last auto remove timer is up
private _shouldAutoRemoveVarName = "f_var_notifier_" + (_listName) + "_shouldRemove";
private _timesAddedVarName = "f_var_notifier_" + (_listName) + "_timesAdded";
private _timesAdded = missionNamespace getVariable [_timesAddedVarName, 0];

[
	NOTIFIER_CLIENT_NEW_NOTIF_EVENT,
	[_listName, name player, _removeFromList]
] call CBA_fnc_serverEvent;

if (_autoRemoveTime > -1 and !_removeFromList) then {
	// Only the last firing timer should remove the player from the list
	// Can tell which timer is last by which one is triggered when times added is 1
	// "timesAdded" could also be called "timersActive"
	_timesAdded = _timesAdded + 1;
	missionNamespace setVariable [_timesAddedVarName, _timesAdded];
	missionNamespace setVariable [_shouldAutoRemoveVarName, true];
	
	[
		{
			params ["_listName", "_playerName"];

			private _shouldAutoRemoveVarName = "f_var_notifier_" + _listName + "_shouldRemove";
			private _shouldAutoRemove = missionNamespace getVariable [_shouldAutoRemoveVarName, false];

			private _timesAddedVarName = "f_var_notifier_" + _listName + "_timesAdded";
			private _timesAdded = missionNamespace getVariable [_timesAddedVarName, 0];
			_timesAdded = _timesAdded - 1;
			missionNamespace setVariable [_timesAddedVarName, _timesAdded];

			DEBUG_FORMAT3_LOG("[ZEUS_NOTIFIER] Auto remove timer up for list %1. Times added: %2. Should remove: %3", _listName, _timesAdded, _shouldAutoRemove);

			if (_timesAdded == 0 and _shouldAutoRemove) then {
				[
					NOTIFIER_CLIENT_NEW_NOTIF_EVENT,
					[_listName, _playerName, true]
				] call CBA_fnc_serverEvent;
			};
		},
		[_listName, name player],
		_autoRemoveTime
	] call CBA_fnc_waitAndExecute;
} else {
	missionNamespace setVariable [_shouldAutoRemoveVarName, false];
}