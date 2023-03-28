// ACRE integration for CAFE, by Bubbus.

params ["_unit"];

diag_log format ["[CFGRDO]: %1", _this];

{
	diag_log format ["[CFGRDO2]: %1", _x];
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

	diag_log format ["[CFGRDO3]: %1", [_radioName, _presetName]];
	[_radioName, _presetName] call acre_api_fnc_setPreset;

} forEach f_arr_acre_allRadios;
