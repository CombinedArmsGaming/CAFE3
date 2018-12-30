params ["_killedUnit", "_newUnit", "_isRuin"];


_typeBefore = typeOf _killedUnit;
_typeAfter = typeOf _newUnit;
_position = getPos _newUnit;

_killReport = ["KilledStatic", _typeBefore, _typeAfter, _isRuin, _position];


if (!isServer) exitWith
{
	[_killReport] remoteExec ["f_fnc_appendKillReport", 2];
};


[_killReport] call f_fnc_appendKillReport;
