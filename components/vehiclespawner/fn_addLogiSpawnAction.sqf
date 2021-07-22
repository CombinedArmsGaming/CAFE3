/*
	Script to create an action on an object which allows to spawn in new vehicles.

	Author: Bubbus and Joecuronium

	Passable arguments:
	0: object to create action on
	1: logi type - as defined in the logi configuration.
*/

#include "macros.hpp";

params ["_logiType", "_spawnIndex", "_vehicle"];

private _vicArrays = GET_VEHICLES_DYNAMIC(_logiType);
private _vicArray = _vicArrays # _spawnIndex;
private _spawnType = _vicArray#0;

_actionCode = {[_target, _actionParams#0] call f_fnc_tryLogiSpawnVehicle};

_conditionCode =
{
	([_player, _target] call f_fnc_canPlayerUseLogi) and {[_target, _actionParams#0] call f_fnc_canLogiSpawnVehicle}
};

_modifierCode =
{
	params ["_target", "_player", "_params", "_actionData"];

	_spawnType = _actionData#0;
	_spawnIndex = _actionData#1;

	_type = _target getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"type"), ""];
	_remaining = _target getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"amount"), 0];
	_gear = _target getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"gear"), ""];

	_newDisplayText = if (_gear isEqualTo "") then
	{
		format ["Deploy '%1' (%2 remaining)", GET_VEHICLE_DISPLAY_NAME(_type), _remaining];
	}
	else
	{
		format ["Deploy '%1' with '%3' (%2 remaining)", GET_VEHICLE_DISPLAY_NAME(_type), _remaining, _gear];
	}


	_actionData set [1, _newDisplayText];

};

_actionToBeAdded =
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

[_vehicle, 0, ["ACE_MainActions"], _actionToBeAdded] call ace_interact_menu_fnc_addActionToObject;
