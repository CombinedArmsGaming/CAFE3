// ACRE integration for CAFE, by Bubbus

private _group = group player;
private _groupId = groupId _group;
private _sideName = [side _group] call f_fnc_sideToString;

private _playerRadios = [player] call f_fnc_acre_getAllRadiosForUnit;

private _configOut = [];
private _defaultPreset = [side _group] call f_fnc_acre_getPresetForSide;

{
	private _baseRadio = [_x] call acre_api_fnc_getBaseRadio;
	private _channelNumber = [_x] call acre_api_fnc_getRadioChannel;
	private _preset =  [_baseRadio] call acre_api_fnc_getPreset;

	private _config = [_baseRadio, _channelNumber];

	if (_preset isNotEqualTo _defaultPreset) then
	{
		_config pushBack _preset;
	};

	private _channelOverrideKey = format ["f_var_acre_groupRadio::%1::%2::%3", _sideName, _groupId, _baseRadio];
	missionNamespace setVariable [_channelOverrideKey, _config, true];
}
foreach _playerRadios;