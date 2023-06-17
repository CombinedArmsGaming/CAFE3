#include "macros.hpp"

params [["_radio", nil, [""]], ["_channel", nil, ["",[]]], ["_side", nil, [west]], ["_groupName", nil, ["",[]]]];

if (typeName _groupName isEqualTo "ARRAY") exitWith
{
    {
        [_radio, _channel, _side, _x] call f_fnc_acre_removeRadioFromAllInGroup;
    }
    forEach _groupName;
};

private _radioKey = format ["--%1::%2::%3", [_side] call f_fnc_sideToString, toUpper _groupName, RADIOS_SELECTOR_ALL];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

_radiosList pushBack [_radio, _channel];

_radiosList