#include "macros.hpp"

params [["_radio", nil, [""]], ["_channel", nil, ["",[]]], ["_side", nil, [west]], ["_role", nil, ["",[]]]];

if (typeName _role isEqualTo "ARRAY") exitWith
{
    {
        [_radio, _channel, _side, _x] call f_fnc_acre_removeRadioFromAllInRole;
    }
    forEach _role;
};

private _radioKey = format ["--%1::%2::%3", [_side] call f_fnc_sideToString, RADIOS_SELECTOR_ALL, toUpper _role];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

_radiosList pushBack [_radio, _channel];

_radiosList