#include "macros.hpp"

// _doMessage param takes "never", "onlyOnSuccess", "always".
params ["_unit", ["_doMessage", "never"]];

RUN_LOCAL_TO(_unit,f_fnc_setupRadioChannels,_this);
RUN_AS_ASYNC(f_fnc_setupRadioChannels);

if (_unit getVariable ["f_var_running_radioChannels", false]) exitWith {};
_unit setVariable ["f_var_running_radioChannels", true];


// Try to inherit radio settings from group if group settings exist.
// If group settings exist, always use those.
// If group settings do not exist and player is the group leader, create new group settings.
// If player is not a leader, wait until group settings exist or circumstances change.
// If player is part of an AI group, skip radio settings.
_allDone = false;
_results = [];

while {!_allDone} do
{
	_group = group _unit;
	_leader = leader _group;

	_configIsLoaded = !((_group getVariable ["f_var_hasRadioConfig", ""]) isEqualTo "");

	if (_configIsLoaded) exitWith
	{
		_hasConfig = _group getVariable ["f_var_hasRadioConfig", false];
		if (_hasConfig) then
		{
			_results = [_unit] call f_fnc_copyGroupRadioChannelsToUnit;
		};

		_allDone = true;
	};


	if (isPlayer _leader and {!(_leader isEqualTo _unit)}) then
	{
		DEBUG_FORMAT1_LOG("[Radios] Player is not leader, waiting for group config in '%1'.",(groupId _group))
		_differentLeader = false;

		waitUntil
		{
			sleep 1;
			_configIsLoaded = !((_group getVariable ["f_var_hasRadioConfig", ""]) isEqualTo "");
			_differentLeader = !(_leader isEqualTo (leader group _unit));
			_differentGroup = !(_group isEqualTo (group _unit));

			(_configIsLoaded or _differentLeader or _differentGroup)
		};

		if (_differentGroup) then
		{
			DEBUG_FORMAT2_LOG("[Radios] Player group changed while waiting (was %1, now %2).",(groupId _group),(groupId group _unit))
			_group = group _unit;
		};

		if (_differentLeader) then
		{
			DEBUG_FORMAT2_LOG("[Radios] Group leader changed while waiting (was %1, now %2).",_leader,(leader group _unit))
			_leader = leader group _unit;
		};

		if (_configIsLoaded and (!_differentGroup) and (!_differentLeader)) then
		{
			DEBUG_FORMAT1_LOG("[Radios] Done waiting for group config, applying to %1.",_unit)

			_hasConfig = _group getVariable ["f_var_hasRadioConfig", false];
			if (_hasConfig) then
			{
				_results = [_unit] call f_fnc_copyGroupRadioChannelsToUnit;
			};

			_allDone = true;
		};
	}
	else
	{
		// Player is group leader, else group is led by AI
		if (player isEqualTo _leader) then
		{
			DEBUG_FORMAT1_LOG("[Radios] %1 is leader of their group, creating radio settings.",_unit)
			_results = [_unit] call f_fnc_setupGroupRadioChannels;
		};

		_allDone = true;

	};

};


if ((!(_doMessage isEqualTo "never")) and {_unit isEqualTo player}) then
{
	_message = "";

	if (count _results > 0) then
	{
		_displayStrings = _results apply {format ["%1: %2", _x#0, _x#1]};

		_message = "Your radio channels have been updated (";
	    _message = _message + (_displayStrings joinString ", ");
		_message = _message + ").";
	}
	else
	{
		if (_doMessage isEqualTo "always") then
		{
			_message = "Your squad does not have any radio channels set up.";
			if (_unit isEqualTo (leader group _unit)) then
			{
				_message = _message + "<br/>Choose 'Set Squad Radio Channels' to make your radio settings official.";
			}
			else
			{
				_message = _message + "<br/>Ask your team leader to 'Set Squad Radio Channels' in ACE Self-interact.";
			};
		};
	};

	if !(_message isEqualTo "") then
	{
		[_message] call f_fnc_createSubtitleText;
	};
};


_unit setVariable ["f_var_running_radioChannels", false];
