#include "macros.hpp"

params ["_unit"];

if (f_radios_settings_acre2_disableRadios) exitWith {};


_group = group _unit;

_groupChannelIndex = _group getVariable ["f_var_radioSR", -1];
_groupLRChannelIndex = _group getVariable ["f_var_radioLR", -1];
_groupXLRChannelIndex = _group getVariable ["f_var_radioXLR", -1];

_hasAnyConfig = (_groupChannelIndex >= 0) or {_groupLRChannelIndex >= 0} or {_groupXLRChannelIndex >= 0};
if !(_hasAnyConfig) exitWith {};


waitUntil
{
	uiSleep 0.1; [_unit] call acre_api_fnc_isInitialized
};

_hasSR = [_unit, f_radios_settings_acre2_standardSHRadio] call acre_api_fnc_hasKindOfRadio;
_radioSR = if (_hasSR) then {[f_radios_settings_acre2_standardSHRadio] call acre_api_fnc_getRadioByType} else {""};

_hasLR = [_unit, f_radios_settings_acre2_standardLRRadio] call acre_api_fnc_hasKindOfRadio;
_radioLR = if (_hasLR) then {[f_radios_settings_acre2_standardLRRadio] call acre_api_fnc_getRadioByType} else {""};

_hasExtra = [_unit, f_radios_settings_acre2_extraRadio] call acre_api_fnc_hasKindOfRadio;
_radioExtra = if (_hasExtra) then {[f_radios_settings_acre2_extraRadio] call acre_api_fnc_getRadioByType} else {""};

_hasBackpack = [_unit, f_radios_settings_acre2_BackpackRadio] call acre_api_fnc_hasKindOfRadio;
_radioBackpack = if (_hasBackpack) then {[f_radios_settings_acre2_BackpackRadio] call acre_api_fnc_getRadioByType} else {""};

_groupID = groupID (group _unit);

_results = [];


if (_hasSR and (_groupChannelIndex >= 0)) then
{
	DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioSR,(_groupChannelIndex + 1))

    [_radioSR, (_groupChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
	_results pushBack ["SR", _groupChannelIndex + 1]

};


if (_hasLR and (_groupLRChannelIndex >= 0)) then
{
	DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioLR,(_groupLRChannelIndex + 1))

    [_radioLR, (_groupLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
	_results pushBack ["LR", _groupLRChannelIndex + 1]

};


if (_hasExtra and (_groupXLRChannelIndex >= 0)) then
{
	DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioExtra,(_groupXLRChannelIndex + 1))

    [_radioExtra, (_groupXLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
	_results pushBack ["XLR", _groupXLRChannelIndex + 1]

};


if (_hasBackpack and (_groupXLRChannelIndex >= 0)) then
{
	DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioExtra,(_groupXLRChannelIndex + 1))

    [_radioBackpack, (_groupXLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
	_results pushBack ["Backpack", _groupXLRChannelIndex + 1]

};


_results
