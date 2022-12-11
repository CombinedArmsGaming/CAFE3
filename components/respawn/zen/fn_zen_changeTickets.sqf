#include "../macros.hpp"

params ["_position", "_object"];

private _dialogContent = 
[
    ["OWNERS", "Add tickets to:", [[], [], [], 0]],
    ["SLIDER", "Amount of tickets", [-25, 25, 0, 0]]
];

private _onConfirm = 
{
    params ["_values"];

    private _owners = _values # 0;
    private _sides = _owners # 0;
    private _groups = _owners # 1;
    private _players = _owners # 2;
    _owners = _sides + _groups + _players;
    if (count _owners <= 0) exitWith {};

    private _tickets = round (_values # 1);
    if (_tickets == 0) exitWith {};

    private _recipients = if (count _owners > 1) then {format ["%1 targets", count _owners]} else {str (_owners # 0)};
    private _verb = if (_tickets > 0) then {"Added"} else {"Removed"};
    private _adjunct = if (_tickets > 0) then {"to"} else {"from"};
    systemChat format ["%1 %2 respawn tickets %3 %4.", _verb, (abs _tickets), _adjunct, _recipients];

    {
        [_x, _tickets, false] remoteExec ["BIS_fnc_respawnTickets", 2];
    } foreach _owners;
};

[
    "Alter respawn tickets",
    _dialogContent,
    _onConfirm
] call zen_dialog_fnc_create;