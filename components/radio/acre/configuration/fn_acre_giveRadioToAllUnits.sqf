#include "macros.hpp"

params [["_radio", nil, [""]], ["_channel", nil, ["",[]]], ["_side", nil, [west]]];

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

private _radioKey = format ["%1::%2::%3", [_side] call f_fnc_sideToString, ALL, ALL];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

if (typeName _radio isEqualTo "ARRAY") then
{
    _radiosList pushBack [_radio#0, _channelName, _radio#1];
}
else
{
    _radiosList pushBack [_radio, _channelName];
};

_radiosList