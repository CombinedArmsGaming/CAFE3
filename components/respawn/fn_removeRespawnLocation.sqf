#include "macros.hpp"

// Convenience function to abstract away target unless needed, and also maintain respawn registry.

SERVER_ONLY;

params [["_location", nil, ["", objNull]], ["_target", nil]];

private _allRegistrations = [_location] call f_fnc_getRespawnRegistrations;

if (isNil '_target') exitWith
{
	{
		[_x#2, _x#3] call BIS_fnc_removeRespawnPosition;

	} forEach _allRegistrations;

	_allRegistrations resize 0;

	true
};

private _targetRegistration = [_location, _target] call f_fnc_getRespawnRegistration;
if (_targetRegistration isEqualTo []) exitWith {false};

[_targetRegistration#2, _targetRegistration#3] call BIS_fnc_removeRespawnPosition;

_allRegistrations deleteAt (_targetRegistration#4);

true