
// Return value meanings:
// 0: success
// 1: not currently possible
// 2: impossible (vehicle destroyed or has no seats)

params ["_unit", "_vehicle"];

if (!alive _vehicle) exitWith { 2 };

_seatCount = [typeOf _vehicle, true] call BIS_fnc_crewCount;
if (_seatCount <= 0) exitWith { 2 };

_crewCount = count fullCrew _vehicle;
_seatsLeft = _seatCount - _crewCount;

if (_seatsLeft < 1) exitWith { 1 };

_success = _unit moveInAny _vehicle;

if (!_success) exitWith { 1 };

0
