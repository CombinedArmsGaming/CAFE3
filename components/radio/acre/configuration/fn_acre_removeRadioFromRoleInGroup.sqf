params [["_radio", nil, [""]], ["_channel", nil, ["",[]]], ["_side", nil, [west]], ["_role", nil, ["",[]]], ["_groupName", nil, ["",[]]]];

private _groupNameUpper = toUpper _groupName;
if (_groupNameUpper isNotEqualTo "DEFAULT") then
{
    (f_map_knownGroups getOrDefault [_side, [], true]) pushBackUnique _groupNameUpper;
};

private _radioKey = format ["--%1::%2::%3", [_side] call f_fnc_sideToString, _groupNameUpper, toUpper _role];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

_radiosList pushBack [_radio, _channel];

_radiosList