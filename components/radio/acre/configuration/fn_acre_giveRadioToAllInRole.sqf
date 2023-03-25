#include "macros.hpp"

params ["_radio", "_channelName", "_side", "_role"];

if (typeName _role isEqualTo "ARRAY") exitWith
{
    {
        [_radio, _channelName, _side, _x] call f_fnc_acre_giveRadioToAllInRole;
    }
    forEach _role;
};

[_radio, _channelName, _side] call f_fnc_acre_generateChannelForRadio;

private _radioKey = format ["%1::%2::%3", [_side] call f_fnc_sideToString, ALL, toUpper _role];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

_radiosList pushBack [_radio, _channelName];

_radiosList