#include "macros.hpp"

params ["_unit"];


_getUnitDetails =
{
	params ["_unit"];

	_type = typeOf _unit;

	private "_side";
	private "_name";

	if (_unit isKindOf "Man") then
	{
		_loadout = _unit getVariable ["f_var_assignGear",""];

		if (!(_loadout isEqualTo "")) then
		{
			_type = toUpper _loadout;
		};

		_side = _unit getVariable ["f_var_side", side group _unit];
		_name = name _unit;

	}
	else
	{
		_commander = effectiveCommander _unit;
		if (isNull _commander) then {_commander = _unit};

		_side = _commander getVariable ["f_var_side", side group _commander];
		_name = name _unit;

	};

	_position = getPos _unit;
	_dir = getDir _unit;

	[_type, _side, _name, _position, _dir]

};


_victimDetails = [_unit] call _getUnitDetails;
_killReport = ["Suicide", daytime, _victimDetails];

// BUB 2018-12-31 TODO :: Find a better way to detect killer than ace_medical_lastDamageSource: ACE overrides this EH's parameters and it's not very good.  Maybe use EntityKilled mission event?
_aceKiller = _unit getVariable ["ace_medical_lastInstigator", objNull];


if !((_aceKiller isEqualTo objNull) or {_aceKiller isEqualTo _unit}) then
{
	_deathType = "Killed";
	_killerDetails = [_aceKiller] call _getUnitDetails;

	_killReport = ["Killed", daytime, _victimDetails, _killerDetails];
};


if (!isServer) exitWith
{
	[_killReport] remoteExec ["f_fnc_appendKillReport", 2];
};


[_killReport] call f_fnc_appendKillReport;
