// ACRE integration for MCFW, by Bubbus.

params ["_unit", "_radios"];

_presetName = switch (side group _unit) do
{
	case west: 		 {f_var_acre_bluforRadioNet};
	case east: 		 {f_var_acre_opforRadioNet};
	case resistance: {f_var_acre_indforRadioNet};
	case civilian: 	 {f_var_acre_civilianRadioNet};
	default 		 {"default"};
};

if (f_var_acre_allSidesShareRadioNets) then
{
	_presetName = "default";
};

{
	[_x, _presetName] call acre_api_fnc_setPreset;
} forEach _radios;
