#include "macros.hpp"

params ["_radio", "_channelName", "_side", "_groupName"];

if (typeName _groupName isEqualTo "ARRAY") exitWith
{
    {
        [_radio, _channelName, _side, _x] call f_fnc_acre_removeRadioFromAllInGroup;
    }
    forEach _groupName;
};

private _radioKey = format ["--%1::%2::%3", [_side] call f_fnc_sideToString, toUpper _groupName, ALL];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

_radiosList pushBack [_radio, _channelName];

_radiosList