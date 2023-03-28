params ["_radio", "_channelName", "_side"];

private _netType = f_map_radioTypes getOrDefault [_radio, ""];
if (_netType isEqualTo "") then {throw format ["Unrecognised radio type '%1' - can't generate a channel for it.", _radio]};

private _radioKey = format ["%1::%2", [_side] call f_fnc_sideToString, toUpper _netType];

private _radiosEntry = f_map_radioChannels getOrDefault [_radioKey, [_side, _netType, []], true];
private _radiosList = _radiosEntry # 2;

_radiosList pushBackUnique _channelName;