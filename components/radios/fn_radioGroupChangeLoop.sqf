#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_radioGroupChangeLoop);

if (f_radios_settings_acre2_disableRadios) exitWith {};

while {true} do
{
	_lastGroup = group player;

	waitUntil
	{
		sleep 0.25;
		_curGroup = group player;
		_changedGroup = !(_curGroup isEqualTo _lastGroup);
		_lastGroup = _curGroup;

		_changedGroup

	};

	[player, "onlyOnSuccess"] call f_fnc_setupRadioChannels;

};
