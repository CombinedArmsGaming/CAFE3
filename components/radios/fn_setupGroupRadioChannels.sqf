#include "macros.hpp"

params ["_unit"];

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

_presetArray = switch (side _unit) do
{
	case blufor: {f_radios_settings_acre2_sr_groups_blufor};
  	case opfor: {f_radios_settings_acre2_sr_groups_opfor};
  	case independent: {f_radios_settings_acre2_sr_groups_indfor};
  	default {f_radios_settings_acre2_sr_groups_indfor};
};

_presetLRArray = switch (side _unit) do
{
	case blufor: {f_radios_settings_acre2_lr_groups_blufor};
  	case opfor: {f_radios_settings_acre2_lr_groups_opfor};
  	case independent: {f_radios_settings_acre2_lr_groups_indfor};
	default {f_radios_settings_acre2_lr_groups_indfor};
};

_presetXLRArray = switch (side _unit) do
{
	case blufor: {f_radios_settings_acre2_xlr_groups_blufor};
  	case opfor: {f_radios_settings_acre2_xlr_groups_opfor};
  	case independent: {f_radios_settings_acre2_xlr_groups_indfor};
	default {f_radios_settings_acre2_xlr_groups_indfor};
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

_groupChannelIndex = -1;
_groupLRChannelIndex = -1;
_groupXLRChannelIndex = -1;

_results = [];


{
	if (_groupID in (_x select 1)) exitWith
	{
		 _groupChannelIndex = _forEachIndex;
	};

} forEach _presetArray;

{
	if (_groupID in (_x select 1)) exitWith
	{
		_groupLRChannelIndex = _forEachIndex;
	};

} forEach _presetLRArray;

{
	if (_groupID in (_x select 1)) exitWith
	{
		_groupXLRChannelIndex = _forEachIndex;
	};

} forEach _presetXLRArray;




_hasAnyConfig = (_groupChannelIndex >= 0) or {_groupLRChannelIndex >= 0} or {_groupXLRChannelIndex >= 0};

if !(_hasAnyConfig) exitWith
{
	_group setVariable ["f_var_hasRadioConfig", false, true];
	[]
};




if (_groupChannelIndex == -1 && {_hasSR}) then
{
	DEBUG_FORMAT1_CHAT("[F3 ACRE2] Warning: Unknown group for short-range channel defaults (%1)", _groupID);
	_groupChannelIndex = 0;
};


if (_groupLRChannelIndex == -1 && {(_hasLR)}) then
{
	DEBUG_FORMAT1_CHAT("[F3 ACRE2] Warning: Unknown group for long-range channel defaults (%1)", _groupID);
  	_groupLRChannelIndex = 0;
};


if (_groupXLRChannelIndex == -1 && {(_hasExtra)}) then
{
	DEBUG_FORMAT1_CHAT("[F3 ACRE2] Warning: Unknown group for extra-long-range channel defaults (%1)", _groupID);
  	_groupXLRChannelIndex = 0;
};




if (_hasSR) then
{
	DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioSR,(_groupChannelIndex + 1))

    [_radioSR, (_groupChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
	_results pushBack ["SR", _groupChannelIndex + 1]

};


if (_hasLR) then
{
	DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioLR,(_groupLRChannelIndex + 1))

    [_radioLR, (_groupLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
	_results pushBack ["LR", _groupLRChannelIndex + 1]

};


if (_hasExtra) then
{
	DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioExtra,(_groupXLRChannelIndex + 1))

    [_radioExtra, (_groupXLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
	_results pushBack ["XLR", _groupXLRChannelIndex + 1]

};


if (_hasBackpack) then
{
	DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioExtra,(_groupXLRChannelIndex + 1))

    [_radioBackpack, (_groupXLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
	_results pushBack ["Backpack", _groupXLRChannelIndex + 1]

};




_group = group _unit;

_group setVariable ["f_var_radioSR", _groupChannelIndex, true];
_group setVariable ["f_var_radioLR", _groupLRChannelIndex, true];
_group setVariable ["f_var_radioXLR", _groupXLRChannelIndex, true];
_group setVariable ["f_var_hasRadioConfig", true, true];

_results
