/*
	Creates a dialog for the zeus to choose a dead player, or all dead players
	
	Arguments:
		0: <STRING> 			Name of the list presented to the zeus
		1: <CODE>				Function to be run when the zeus presses confirm.
									The provided function will be passed:
										0: <ARRAY> Array of players chosen
										1: <ARRAY> Arguments provided to this function
		2: <ARRAY> (optional)	Arguments passed back to onConfirm
*/
#include "../macros.hpp"

params ["_listName", "_onConfirm", ["_args", []]];

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;
private _deadPlayers = _humanPlayers select {!alive _x};

if (count _deadPlayers <= 0) exitWith
{
    systemChat "No players are currently dead.";
};

// Make each player an array containing only that player, for easier data processing
private _deadPlayersArrayList = _deadPlayers apply {[_x]};

// Create the player names list
private _playerNames = _deadPlayers apply {name _x};

// Add the option for all dead players to the values and to the names
_deadPlayersArrayList insert [0, [+_deadPlayers]];
_playerNames insert [0, ["All dead players"]];

private _dialogContent = 
[
    ["LIST", _listName, [_deadPlayersArrayList, _playerNames, 0, 10], true]
];

[
    "Allow immediate respawn",
    _dialogContent,
    _onConfirm,
	{},
	_args
] call zen_dialog_fnc_create;