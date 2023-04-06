params [["_radio", nil, [""]], ["_channel", nil, ["",[]]], ["_side", nil, [west]], ["_role", nil, ["",[]]], ["_groupName", nil, ["",[]]]];

private _radioKey = format ["--%1::%2::%3", [_side] call f_fnc_sideToString, toUpper _groupName, toUpper _role];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

_radiosList pushBack [_radio, _channel];

_radiosList