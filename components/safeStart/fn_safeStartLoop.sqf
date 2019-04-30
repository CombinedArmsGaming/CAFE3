#include "macros.hpp"

// F3 - Safe Start, Server Loop
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================


[] spawn
{
	_continueLoop = true;

	while {_continueLoop} do
	{
		uiSleep 0.5;

		_endTime = missionNamespace getVariable ["f_var_safestart_end", 0];
		_timeLeft = _endTime - time;
		_timeLeftFloor = floor _timeLeft;

		if (_timeLeftFloor < 60) then
		{
			if (_timeLeftFloor == 30 or _timeLeftFloor == 10) then
			{
				["SafeStart", [format ["%1 seconds remaining", _timeLeftFloor]]] remoteExec ["bis_fnc_showNotification"];
				uiSleep 1;
			};
		}
		else
		{
			if (_timeLeftFloor mod 60 == 0) then
			{
				_timeMins = _timeLeftFloor / 60;
				_plural = if (_timeMins == 1) then {"minute"} else {"minutes"};

				["SafeStart", [format ["%1 %2 remaining", _timeMins, _plural]]] remoteExec ["bis_fnc_showNotification"];
				uiSleep 1;

			};

		};

		if (_timeLeft <= 0 and f_var_safeStartEnabled) then
		{
			f_var_safeStartEnabled = false;
		    [] remoteExec ["f_fnc_disableSafeStart", 0, "SafeStartSync"];

			["SafeStart", ["Mission starting now!"]] remoteExec ["bis_fnc_showNotification"];

			_continueLoop = false;

		};

	};

}
