#include "macros.hpp"

params [["_radio", nil, [""]], ["_channel", nil, ["",[]]], ["_side", nil, [west]], ["_groupName", nil, ["",[]]]];

if (_groupName isEqualType []) exitWith
{
    {
        [_radio, _channel, _side, _x] call f_fnc_acre_giveRadioToAllInGroup;
    }
    forEach _groupName;
};

private _groupNameUpper = toUpper _groupName;
if (_groupNameUpper isNotEqualTo "DEFAULT") then
{
    (f_map_knownGroups getOrDefault [_side, [], true]) pushBackUnique _groupNameUpper;
};

private _channelHasPresetOverride = (_channel isEqualType []);
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

private _radioKey = format ["%1::%2::%3", [_side] call f_fnc_sideToString, _groupNameUpper, RADIOS_SELECTOR_ALL];

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