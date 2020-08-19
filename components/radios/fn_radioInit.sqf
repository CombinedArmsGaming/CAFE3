#include "macros.hpp"

// F3 - ACRE2 Init
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================


// jip check
if (IS_CLIENT) then
{
	WAIT_UNTIL_PLAYER_EXISTS();
};

// setup presets
_presetSetup = [] call f_fnc_setupRadioPresets;


// run client stuff.
if (IS_CLIENT) then
{
	waitUntil { IS_TRUE(f_radios_loadedSettings) };
	// define our languages (need to be the same order for everyone)
	{
		_x call acre_api_fnc_babelAddLanguageType;

	} foreach f_radios_settings_acre2_languages;

	f_radios_ready = true;

};
