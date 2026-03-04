#include "../macros.hpp"

params ["_position", "_object"];

private _dialogContent = 
[
    ["OWNERS", "Spawnpoint owner (CHOOSE ONE ONLY)", [[west], [], [], 0]],
    ["EDIT", "Spawnpoint name", []]
];

if !(isNull _object) then
{
    private _name = if (_object isKindOf "CAManBase") then {name _object} else {getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")};
    _dialogContent pushBack ["CHECKBOX", format ["Attach spawnpoint to %1?", _name]];
};

private _onConfirm = 
{
    params ["_values", "_args"];
    _args params ["_position", "_object"];

    private _owners = _values # 0;
    private _sides = _owners # 0;
    private _groups = _owners # 1;
    private _players = _owners # 2;
    _owners = _sides + _groups + _players;
    if (count _owners <= 0) exitWith {};

    private _name = _values param [1, ""];
    private _shouldAttach = _values param [2, false];

    private _spawnPos = if ((!isNull _object) and _shouldAttach) then {_object} else {ASLToATL _position};
    private _posName = if ((!isNull _object) and _shouldAttach) then 
    {
        if (_object isKindOf "CAManBase") then {name _object} else {getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")}
    } 
    else 
    {
        str ASLToATL _position
    }; 

    systemChat format ["Created spawnpoint '%3' for %1 at %2.", _owners#0, _posName, _name];

    [_owners#0, _spawnPos, _name] remoteExec ["BIS_fnc_addRespawnPosition", 2];
};

[
    "Create new spawnpoint",
    _dialogContent,
    _onConfirm,
    {},
    _this
] call zen_dialog_fnc_create;