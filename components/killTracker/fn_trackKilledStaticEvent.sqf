params ["_unit"];


_type = typeOf _unit;
_position = getPos _unit;

_killReport = ["KilledStatic", _type, _position];


if (!isServer) exitWith
{
	[_killReport] remoteExecCall ["f_fnc_appendKillReport", 2];
}
else
{
	[_killReport] call f_fnc_appendKillReport;
};
