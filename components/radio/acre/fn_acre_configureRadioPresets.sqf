// ACRE integration for CAFE, by Bubbus.

params ["_unit", "_radioNetOverrides"];

private _radioOverrideMap = createHashMapFromArray _radioNetOverrides;

{
	private _radioName = _x;
	private _netOverride = _radioOverrideMap getOrDefault [_radioName, ""];

	private _presetName = if (_netOverride isNotEqualTo "") then
	{
		_netOverride
	}
	else
	{
		[side group _unit] call f_fnc_acre_getPresetForSide
	};
	
	[_radioName, _presetName] call acre_api_fnc_setPreset;

} forEach f_arr_acre_allRadios;
