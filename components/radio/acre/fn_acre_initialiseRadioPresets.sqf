// ACRE integration for CAFE, by Bubbus

private _allPresetDefs = values f_map_radioChannels;
private _visitedPresetNets = [];


// Visit each radio-preset definition, generate channels for each net in the preset.  Channels will be in order of appearance in the config file.
{
	_x params ["_side", "_netType", "_channelNames"];

	diag_log format ["[INITRDO]: %1", _x];

	private _sideStr = [_side] call f_fnc_sideToString;

	private _preset = missionNamespace getVariable [format ["f_var_acre_%1RadioNet", _sideStr], ""];
	if (_preset isEqualTo "") then {continue};

	// Sides can share a preset, so avoid duplicate assignment here.
	private _presetNetKey = format ["%1::%2", _preset, toUpper _netType];
	if (_presetNetKey in _visitedPresetNets) then {continue};

	private _radioNames = f_map_radioTypesInverse getOrDefault [_netType, []];

	{
		private _radioName = _x;
		[_radioName, "default2", _preset] call acre_api_fnc_copyPreset;		

		if (_radioName in f_map_acre_channelNameParameters) then
		{
			private _nameParam = f_map_acre_channelNameParameters getOrDefault [_radioName, "label"];
			
			{
				diag_log format ["[INITRDO2]: %1", [_radioName, _preset, _forEachIndex + 1, _nameParam, _x]];
				[_radioName, _preset, _forEachIndex + 1, _nameParam, _x] call acre_api_fnc_setPresetChannelField;
			} forEach _channelNames;
		};

	} forEach _radioNames;

	_visitedPresetNets pushBack _presetNetKey;

} forEach _allPresetDefs;