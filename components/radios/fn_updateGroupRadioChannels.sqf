#include "macros.hpp"

params ["_unit", ["_message", false]];

if (f_radios_settings_acre2_disableRadios) exitWith
{
	_group = group _unit;
	_group setVariable ["f_var_hasRadioConfig", false, true];

	[]
};


waitUntil
{
	uiSleep 0.1; [_unit] call acre_api_fnc_isInitialized
};


_groupChannelIndex = -1;
_groupLRChannelIndex = -1;
_groupXLRChannelIndex = -1;


_hasSR = [_unit, f_radios_settings_acre2_standardSHRadio] call acre_api_fnc_hasKindOfRadio;

if (_hasSR) then
{
	_radioSR = [f_radios_settings_acre2_standardSHRadio] call acre_api_fnc_getRadioByType;

	_groupChannelIndex = [_radioSR] call acre_api_fnc_getRadioChannel;
	_groupChannelIndex = _groupChannelIndex - 1;

};


_hasLR = [_unit, f_radios_settings_acre2_standardLRRadio] call acre_api_fnc_hasKindOfRadio;

if (_hasLR) then
{
	_radioLR = [f_radios_settings_acre2_standardLRRadio] call acre_api_fnc_getRadioByType;

	_groupLRChannelIndex = [_radioLR] call acre_api_fnc_getRadioChannel;
	_groupLRChannelIndex = _groupLRChannelIndex - 1;

};


_hasExtra = [_unit, f_radios_settings_acre2_extraRadio] call acre_api_fnc_hasKindOfRadio;

if (_hasExtra) then
{
	_radioExtra = [f_radios_settings_acre2_extraRadio] call acre_api_fnc_getRadioByType;

	_groupXLRChannelIndex = [_radioExtra] call acre_api_fnc_getRadioChannel;
	_groupXLRChannelIndex = _groupXLRChannelIndex - 1;

}
else
{
	_hasBackpack = [_unit, f_radios_settings_acre2_BackpackRadio] call acre_api_fnc_hasKindOfRadio;

	if (_hasBackpack) then
	{
		_radioBackpack = [f_radios_settings_acre2_BackpackRadio] call acre_api_fnc_getRadioByType;

		_groupXLRChannelIndex = [_radioBackpack] call acre_api_fnc_getRadioChannel;
		_groupXLRChannelIndex = _groupXLRChannelIndex - 1;

	};

};


_group = group _unit;
_results = [];

if (_groupChannelIndex >= 0) then
{
	_group setVariable ["f_var_radioSR", _groupChannelIndex, true];
	_results pushBack ["SR", _groupChannelIndex + 1]
};

if (_groupLRChannelIndex >= 0) then
{
	_group setVariable ["f_var_radioLR", _groupLRChannelIndex, true];
	_results pushBack ["LR", _groupLRChannelIndex + 1]
};

if (_groupXLRChannelIndex >= 0) then
{
	_group setVariable ["f_var_radioXLR", _groupXLRChannelIndex, true];
	_results pushBack ["XLR", _groupXLRChannelIndex + 1]
};


_group setVariable ["f_var_hasRadioConfig", (count _results > 0), true];


if (_message and {_unit isEqualTo player} and {count _results > 0}) then
{
	_displayStrings = _results apply {format ["%1: %2", _x#0, _x#1]};

	_message = "Your squad's default radio channels have been changed (";
    _message = _message + (_displayStrings joinString ", ");
	_message = _message + ").<br/>Squad members can get these channels automatically by using 'CA Squad Actions'.";

	[_message] call f_fnc_createSubtitleText;
};

_results
