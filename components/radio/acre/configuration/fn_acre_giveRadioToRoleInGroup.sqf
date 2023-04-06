params [["_radio", nil, [""]], ["_channel", nil, ["",[]]], ["_side", nil, [west]], ["_role", nil, ["",[]]], ["_groupName", nil, ["",[]]]];

private _multipleGroups = (typeName _groupName isEqualTo "ARRAY");
private _multipleRoles = (typeName _role isEqualTo "ARRAY");

if (_multipleGroups) exitWith
{
    {
        [_radio, _channel, _side, _role, _x] call f_fnc_acre_giveRadioToRoleInGroup;
    }
    forEach _groupName;
};

if (_multipleRoles) exitWith
{
    {
        [_radio, _channel, _side, _x, _groupName] call f_fnc_acre_giveRadioToRoleInGroup;
    }
    forEach _role;
};

private _channelHasPresetOverride = (typeName _channel isEqualTo "ARRAY");
private _channelName = _channel;

private _preset = if (_channelHasPresetOverride) then
{
    _channelName = _channel#0;
    (_channel#1)
}
else
{
    [_side] call f_fnc_acre_getPresetForSide
};

[_radio, _channelName, _preset] call f_fnc_acre_generateChannelForRadio;

private _radioKey = format ["%1::%2::%3", [_side] call f_fnc_sideToString, toUpper _groupName, toUpper _role];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

if (_channelHasPresetOverride) then
{
    _radiosList pushBack [_radio, _channel#0, _channel#1];
}
else
{
    _radiosList pushBack [_radio, _channelName];
};

_radiosList