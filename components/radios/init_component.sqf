#include "macros.hpp"

DEBUG_PRINT_LOG("RADIOS2: initting radios")

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

	[] spawn f_fnc_radioGroupChangeLoop;

	f_radios_ready = true;

	DEBUG_PRINT_LOG("RADIOS2: done with client init")

};
