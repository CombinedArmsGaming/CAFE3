#include "macros.hpp"

params [["_radio", nil, [""]], ["_channel", nil, ["",[]]], ["_side", nil, [west]], ["_groupName", nil, ["",[]]]];

if (typeName _groupName isEqualTo "ARRAY") exitWith
{
    {
        [_radio, _channel, _side, _x] call f_fnc_acre_giveRadioToAllInGroup;
    }
    forEach _groupName;
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

private _radioKey = format ["%1::%2::%3", [_side] call f_fnc_sideToString, toUpper _groupName, RADIOS_SELECTOR_ALL];

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