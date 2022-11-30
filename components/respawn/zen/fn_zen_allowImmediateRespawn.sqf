#include "../macros.hpp"

params ["_position", "_object"];

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;
private _deadPlayers = _humanPlayers select {!alive _x};

if (count _deadPlayers <= 0) exitWith
{
    systemChat "No players are currently dead.";
};

private _playerNames = _deadPlayers apply {name _x};

private _dialogContent = 
[
    ["LIST", "Allow respawn of player", [_deadPlayers, _playerNames, 0, 10]]
];

private _onConfirm = 
{
    params ["_values"];

    private _toRespawn = _values # 0;
    if (isNull _toRespawn) exitWith {};

    systemChat format ["Allowing immediate respawn for %1.", name _toRespawn];

    [] remoteExec ["f_fnc_allowImmediateRespawnLocal", _toRespawn];
};

[
    "Allow immediate respawn",
    _dialogContent,
    _onConfirm
] call zen_dialog_fnc_create;