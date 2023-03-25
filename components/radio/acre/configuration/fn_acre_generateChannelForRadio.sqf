params ["_radio", "_channelName", "_side"];

private _netType = f_map_radioTypes getOrDefault [_radio, ""];
if (_netType isEqualTo "") throw format ["Unrecognised radio type '%1' - can't generate a channel for it.", _radio];

private _radioKey = format ["%1::%2", [_side] call f_fnc_sideToString, toUpper _netType];

private _radiosList = f_map_radioChannels getOrDefault [_radioKey, [], true];

_radiosList pushBackUnique _channelName;