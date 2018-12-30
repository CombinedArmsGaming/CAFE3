params ["_unit"];


_type = typeOf _unit;

if (_unit isKindOf "Man") then
{
	_loadout = _unit getVariable ["f_var_assignGear",""];

	if (!(_loadout isEqualTo "")) then
	{
		_type = toUpper _loadout;
	};
};

_side = _unit getVariable ["f_var_side", side group _unit];
_name = name _unit;
_position = getPos _unit;
_dir = getDir _unit;

_killReport = ["Killed", _type, _side, _name, _position, _dir];


if (!isServer) exitWith
{
	[_killReport] remoteExec ["f_fnc_appendKillReport", 2];
};


[_killReport] call f_fnc_appendKillReport;
