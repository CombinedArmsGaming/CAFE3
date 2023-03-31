// ACRE integration for CAFE, by Bubbus.

params ["_unit"];

{
	private _radioName = _x;

	private _presetName = if (typeName _x isEqualTo "ARRAY") then
	{
		_radioName = _x#0;
		_x#1
	}
	else
	{
		switch (side group _unit) do
		{
			case west: 		 {f_var_acre_bluforRadioNet};
			case east: 		 {f_var_acre_opforRadioNet};
			case resistance: {f_var_acre_indforRadioNet};
			case civilian: 	 {f_var_acre_civRadioNet};
			default 		 {"default"};
		}
	};
	
	[_radioName, _presetName] call acre_api_fnc_setPreset;

} forEach f_arr_acre_allRadios;
