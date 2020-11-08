#include "macros.hpp"

params ["_unit", ["_message", false]];

RUN_LOCAL_TO(_unit,f_fnc_setupRadioChannels,_this);
RUN_AS_ASYNC(f_fnc_setupRadioChannels);

if (_unit getVariable ["f_var_running_radioChannels", false]) exitWith {};
_unit setVariable ["f_var_running_radioChannels", true];


// ASSIGN DEFAULT CHANNELS TO RADIOS
// Depending on the squad joined, each radio is assigned a default starting channel

if (!f_radios_settings_acre2_disableRadios) then
{
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

	_radioSR = [f_radios_settings_acre2_standardSHRadio] call acre_api_fnc_getRadioByType;
	_radioLR = [f_radios_settings_acre2_standardLRRadio] call acre_api_fnc_getRadioByType;
	_radioExtra = [f_radios_settings_acre2_extraRadio] call acre_api_fnc_getRadioByType;
	_radioBackpack = [f_radios_settings_acre2_BackpackRadio] call acre_api_fnc_getRadioByType;

	_hasSR = ((!isNil "_radioSR") && {_radioSR != ""});
	_hasLR = ((!isNil "_radioLR") && {_radioLR != ""});
	_hasExtra = ((!isNil "_radioExtra") && {_radioExtra != ""});
	_hasBackpack = ((!isNil "_radioBackpack") && {_radioBackpack != ""});

	_groupID = groupID (group _unit);

	_groupChannelIndex = -1;
  	_groupLRChannelIndex = -1;


	if (_hasSR) then
	{
	  	{
	  		if (_groupID in (_x select 1)) exitWith
			{
				 _groupChannelIndex = _forEachIndex;
			};

	  	} forEach _presetArray;

  	};


  	if (_hasLR || _hasExtra) then
	{
	  	{
	  		if (_groupID in (_x select 1)) exitWith
			{
				_groupLRChannelIndex = _forEachIndex;
			};

	  	} forEach _presetLRArray;

  	};


	if (_groupChannelIndex == -1 && {_hasSR}) then
	{
		DEBUG_FORMAT1_CHAT("[F3 ACRE2] Warning: Unknown group for short-range channel defaults (%1)", _groupID);
		_groupChannelIndex = 0;
	};


	if (_groupLRChannelIndex == -1 && {(_hasLR || _hasExtra)}) then
	{
  		DEBUG_FORMAT1_CHAT("[F3 ACRE2] Warning: Unknown group for long-range channel defaults (%1)", _groupID);
	  	_groupLRChannelIndex = 0;
	};


	if (_hasSR) then
	{
		DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioSR,(_groupChannelIndex + 1))

	    [_radioSR, (_groupChannelIndex + 1)] call acre_api_fnc_setRadioChannel;

	};


	if (_hasLR) then
	{
		DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioLR,(_groupLRChannelIndex + 1))

	    [_radioLR, (_groupLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;

	};


	if (_hasExtra) then
	{
		DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioExtra,(_groupLRChannelIndex + 1))

	    [_radioExtra, (_groupLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;

	};


	if (_hasBackpack) then
	{
		DEBUG_FORMAT2_LOG("[Radios] Setting radio channel for '%1' to %2",_radioExtra,(_groupLRChannelIndex + 1))

	    [_radioBackpack, (_groupLRChannelIndex + 1)] call acre_api_fnc_setRadioChannel;

	};

	if (_message and {_unit isEqualTo player} and {_hasLR or _hasSR or _hasExtra or _hasBackpack}) then
	{
		_message = "Your radio channels have been updated";

		if (_hasLR or _hasSR or _hasExtra or _hasBackpack) then
		{
			_message = _message + " ( ";
		};

		if (_hasSR) then
		{
			_message = _message + (format ["SR:%1 ", (_groupChannelIndex + 1)])
		};

		if (_hasLR or _hasExtra or _hasBackpack) then
		{
			_message = _message + (format ["LR:%1 ", (_groupLRChannelIndex + 1)])
		};

		if (_hasLR or _hasSR or _hasExtra or _hasBackpack) then
		{
			_message = _message + ")";
		};

		_message = _message + ".";

		"CA2RadioMessage" cutText [_message, "PLAIN DOWN", 1.5];
	};

};

_unit setVariable ["f_var_running_radioChannels", false];
