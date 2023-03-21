// ACRE integration for CAFE, by Bubbus

{
	private _radioName = _x;

	{
		[_radioName, "default2", _forEachIndex + 1, "label", _x#0] call acre_api_fnc_setPresetChannelField;
	} forEach f_radios_settings_acre2_lr_groups_blufor;

	{
		[_radioName, "default3", _forEachIndex + 1, "label", _x#0] call acre_api_fnc_setPresetChannelField;
	} forEach f_radios_settings_acre2_lr_groups_opfor;

	{
		[_radioName, "default4", _forEachIndex + 1, "label", _x#0] call acre_api_fnc_setPresetChannelField;
	} forEach f_radios_settings_acre2_lr_groups_indfor;

} forEach ["ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC117F"];