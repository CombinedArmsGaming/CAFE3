params ["_radio", "_channelNumber", "_preset"];

if (isNil "_preset") then 
{
    _preset = [side group player] call f_fnc_acre_getPresetForSide;
};

private _netType = f_map_radioTypes getOrDefault [_radio, ""];
if (_netType isEqualTo "") then {throw format ["Unrecognised radio type '%1' - can't get a channel name for it.", _radio]};

private _radioKey = format ["%1::%2", _preset, toUpper _netType];

private _radiosEntry = f_map_radioChannels getOrDefault [_radioKey, [_preset, _netType, []]];
private _channelList = _radiosEntry#2;
private _channelName = _channelList select (_channelNumber - 1);

_channelName