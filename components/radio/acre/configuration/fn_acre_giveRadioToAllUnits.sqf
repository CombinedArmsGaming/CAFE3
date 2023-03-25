#include "macros.hpp"

params ["_radio", "_channelName", "_side"];

[_radio, _channelName, _side] call f_fnc_acre_generateChannelForRadio;

private _radioKey = format ["%1::%2::%3", [_side] call f_fnc_sideToString, ALL, ALL];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

_radiosList pushBack [_radio, _channelName];

_radiosList