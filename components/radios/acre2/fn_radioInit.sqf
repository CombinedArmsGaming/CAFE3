// F3 - ACRE2 Init
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================


// jip check
if (hasInterface && (isNull player)) then
{
	waitUntil {sleep 0.1; !isNull player};
};

// setup presets
_presetSetup = [] call f_fnc_setupRadioPresets;


// run client stuff.
if (hasInterface) then
{
	// define our languages (need to be the same order for everyone)
	{
		_x call acre_api_fnc_babelAddLanguageType;

	} foreach f_radios_settings_acre2_languages;

	[] call f_fnc_clientRadioInit;

};
