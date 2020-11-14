#include "macros.hpp"

params ["_unit", ["_message", false]];

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

	_hasConfig = !((_group getVariable ["f_var_radioSR", ""]) isEqualTo "");

	if (_hasConfig) exitWith
	{
		_results = [_unit] call f_fnc_copyGroupRadioChannelsToUnit;
		_allDone = true;
	};


	if (isPlayer _leader and {!(_leader isEqualTo _unit)}) then
	{
		DEBUG_FORMAT1_LOG("[Radios] Player is not leader, waiting for group config in '%1'.",(groupId _group))
		_differentLeader = false;

		waitUntil
		{
			sleep 0.1;
			_hasConfig = !((_group getVariable ["f_var_radioSR", ""]) isEqualTo "");
			_differentLeader = !(_leader isEqualTo (leader group _unit));
			_differentGroup = !(_group isEqualTo (group _unit));

			(_hasConfig or _differentLeader or _differentGroup)
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

		if (_hasConfig and (!_differentGroup) and (!_differentLeader)) then
		{
			DEBUG_FORMAT1_LOG("[Radios] Done waiting for group config, applying to %1.",_unit)
			_results = [_unit] call f_fnc_copyGroupRadioChannelsToUnit;
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


if (_message and {_unit isEqualTo player} and {count _results > 0}) then
{
	_displayStrings = _results apply {format ["%1: %2", _x#0, _x#1]};

	_message = "Your radio channels have been updated (";
    _message = _message + (_displayStrings joinString ", ");
	_message = _message + ").";

	"CA2RadioMessage" cutText [_message, "PLAIN DOWN", 1.5];
};


_unit setVariable ["f_var_running_radioChannels", false];
