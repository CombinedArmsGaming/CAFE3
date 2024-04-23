/*
	Script to create an action on an object which allows to spawn in new vehicles.

	Author: Bubbus and Joecuronium

	Passable arguments:
	0: logi type - as defined in the logi configuration.
	1: spawn index - numeric ideitifier of the object to spawn.  ordered by configuration order.
	2: object to create action on

	Returns:
	The action array.

*/

#include "macros.hpp"

params ["_logiType", "_spawnIndex", "_vehicle"];

private _vicArrays = GET_VEHICLES_DYNAMIC(_logiType);
private _vicArray = _vicArrays # _spawnIndex;
private _spawnType = _vicArray#0;

private _actionCode =
{
	params ["_target", "_player", "_params"];

	[_target, _params#0] call f_fnc_tryLogiSpawnProcedure
};

private _conditionCode =
{
	params ["_target", "_player", "_params"];

	([_player, _target] call f_fnc_canPlayerUseLogi) and {[_target, _params#0] call f_fnc_canLogiSpawnVehicle}
};

private _modifierCode =
{
	params ["_target", "_player", "_params", "_actionData"];

	private _spawnIndex = _params#0;

	private _type = _target getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"type"), ""];
	private _remaining = _target getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"amount"), 0];
	private _gearOrCode = _target getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"gear"), ""];
	private _text = _target getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"text"), ""];

	private _newDisplayText = if (_text isNotEqualTo "") then
	{
		format ["Deploy '%1' (%2 remaining)", _text, _remaining]
	}
	else
	{
		if ((_gearOrCode isEqualTo "") or (_gearOrCode isEqualType {})) then
		{
			format ["Deploy '%1' (%2 remaining)", GET_VEHICLE_DISPLAY_NAME(_type), _remaining]
		}
		else
		{
			format ["Deploy '%1' with '%3' gear (%2 remaining)", GET_VEHICLE_DISPLAY_NAME(_type), _remaining, _gearOrCode]
		}
	};

	_actionData set [1, _newDisplayText];

};

private _actionToBeAdded =
[
	(format ["Logi_Spawn_%1", _spawnIndex]),
	(format ["Deploy '%1'" , GET_VEHICLE_DISPLAY_NAME(_spawnType)]),
	"",
	_actionCode,
	_conditionCode,
	nil,
	[_spawnIndex, _logiType],
	nil,
	15,
	[false, false, false, false, true],
	_modifierCode

] call ace_interact_menu_fnc_createAction;

_actionToBeAdded
