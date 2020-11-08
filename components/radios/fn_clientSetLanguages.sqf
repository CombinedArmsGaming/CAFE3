#include "macros.hpp"

params ["_unit"];

_languages = switch (side _unit) do
{
	case blufor: {f_radios_settings_acre2_language_blufor};
	case opfor: {f_radios_settings_acre2_language_opfor};
	case independent: {f_radios_settings_acre2_language_indfor};
	default {f_radios_settings_acre2_language_indfor};
};


_languages call acre_api_fnc_babelSetSpokenLanguages;
[_languages select 0] call acre_api_fnc_babelSetSpeakingLanguage;

DEBUG_FORMAT1_LOG("[Radios] Using languages: %1",_languages)
DEBUG_FORMAT1_LOG("[Radios] Speaking: %1",(_languages select 0))
