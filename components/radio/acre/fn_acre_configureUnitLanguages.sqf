#include "macros.hpp"

// ACRE integration for CAFE, by Bubbus

private _performLanguageAssignment = 
{
	params ["_role", "_unit", "_faction"];

	_languages = switch (side group _unit) do
	{
		case blufor: 		{f_arr_acre_languages_blufor};
		case opfor: 		{f_arr_acre_languages_opfor};
		case independent: 	{f_arr_acre_languages_indfor};
		case civilian: 		{f_arr_acre_languages_civilian};
		default 			{f_arr_acre_languages_civilian};
	};

	DEBUG_FORMAT2_LOG("[RADIO-2] Setting languages for player '%1' to %2.",_unit, _languages)

	_languages call acre_api_fnc_babelSetSpokenLanguages;
	[_languages select 0] call acre_api_fnc_babelSetSpeakingLanguage;
};


// Ensure languages array is initialised before continuing.
if ((!isNil 'acre_sys_core_languages') and {(count acre_sys_core_languages) > 0}) then
{
	_this call _performLanguageAssignment;
}
else
{
	[
		{
			(!isNil 'acre_sys_core_languages') and {(count acre_sys_core_languages) > 0}
		},
		_performLanguageAssignment,
		_this

	] call CBA_fnc_waitUntilAndExecute;
};