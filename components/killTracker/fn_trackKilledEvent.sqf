params ["_unit"];


_type = typeOf _unit;
_side = _unit getVariable ["f_var_side", side group _unit];
_name = name _unit;
_position = getPos _unit;
_dir = getDir _unit;

_killReport = [_type, _side, _name, _position, _dir];


if (!isServer) exitWith
{
	[_killReport] remoteExecCall ["f_fnc_appendKillReport", 2];
}
else
{
	[_killReport] call f_fnc_appendKillReport;
};
