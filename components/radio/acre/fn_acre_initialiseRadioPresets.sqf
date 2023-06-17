// ACRE integration for CAFE, by Bubbus

private _allPresetDefs = values f_map_radioChannels;

// Visit each radio-preset definition, generate channels for each net in the preset.  Channels will be in order of appearance in the config file.
{
	_x params ["_preset", "_netType", "_channelNames"];

	if (_preset isEqualTo "") then {continue};

	private _radioNames = f_map_radioTypesInverse getOrDefault [_netType, []];

	{
		private _radioName = _x;

		// Important: if we use a preset without templating it upon one of these defaults, everything breaks.
		[_radioName, "default2", _preset] call acre_api_fnc_copyPreset;		

		if (_radioName in f_map_acre_channelNameParameters) then
		{
			private _nameParam = f_map_acre_channelNameParameters getOrDefault [_radioName, "label"];
			
			{
				[_radioName, _preset, _forEachIndex + 1, _nameParam, _x] call acre_api_fnc_setPresetChannelField;
			} forEach _channelNames;
		};

	} forEach _radioNames;

} forEach _allPresetDefs;