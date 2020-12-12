#include "macros.hpp"

params ["_unit"];

_presetName = switch (side _unit) do
{
	case west: {"default2"};
	case east: {"default3"};
	case resistance: {"default4"};
	default {"default"};

};


if (f_radios_settings_acre2_disableFrequencySplit) then
{
	_presetName = "default";
};


DEBUG_FORMAT1_LOG("[Radios] Using preset: %1",_presetName)


_ret = ["ACRE_PRC343", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ACRE_PRC148", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ACRE_PRC152", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ACRE_PRC117F", _presetName ] call acre_api_fnc_setPreset;
_ret = ["ItemRadio", _presetName ] call acre_api_fnc_setPreset;

_ret
