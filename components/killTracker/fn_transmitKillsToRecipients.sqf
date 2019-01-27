#include "macros.hpp"

RUN_ON_SERVER(f_fnc_transmitKillsToRecipients,_this);

_recipients = [];

{
    _isRecipient = (_x getVariable ["f_var_isKillLogRecipient", false] or {admin owner _x > 0});

	if (_isRecipient) then
	{
		_recipients pushBack _x;
	};

} forEach allPlayers;

if (count _recipients <= 0) exitWith {};


_killTracking = missionNamespace getVariable [FULL_KILL_LOG_KEY_SERVER, []];
_currentLogSize = count _killTracking;

if (_currentLogSize <= 0) exitWith {};


{
    _lastLogSize = _x getVariable ["f_var_killLogLastSize", 0];

	if (_currentLogSize > _lastLogSize) then
	{
		_logDiff = _killTracking select [_lastLogSize, (_currentLogSize - _lastLogSize)];

		[_logDiff, _x, _currentLogSize] spawn f_fnc_transmitLogDiff;

	};

} forEach _recipients;
