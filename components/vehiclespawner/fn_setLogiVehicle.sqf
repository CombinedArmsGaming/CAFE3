/*
	Script to create an action on an object which allows to spawn in new vehicles.

	Author: Bubbus and Joecuronium

	Passable arguments:
	0: object to create action on
	1: logi type - as defined in the logi configuration.
*/

#include "macros.hpp";

params ["_vehicle", "_logiType"];

if !IS_REGISTERED_LOGI(_logiType) exitWith
{
	DEBUG_FORMAT2_LOG("[LOGI-VICS]: Tried to apply an unknown logi config '%1' to a vehicle '%2'.",_logiType,_vehicle)
};

private _vehiclesArray = GET_VEHICLES(_logiType);


if (isServer) then
{
	SET_LOGITYPE(_vehicle,_logiType);

	{
		private _vicType = _x#0;
		private _amount = _x#1;
		private _gear = _x param [2, ""];

		_vehicle setVariable [LOGIVIC_VAR_DYNAMIC(_forEachIndex,"type"), _vicType, true];
		_vehicle setVariable [LOGIVIC_VAR_DYNAMIC(_forEachIndex,"amount"), _amount, true];
		_vehicle setVariable [LOGIVIC_VAR_DYNAMIC(_forEachIndex,"gear"), _gear, true];

	} forEach _vehiclesArray;

};


if (IS_PLAYER) then
{
	[_logiType, _vehiclesArray, _vehicle] spawn
	{
		params ["_logiType", "_vehiclesArray", "_vehicle"];

		{
			[_logiType, _forEachIndex, _vehicle] call f_fnc_addLogiSpawnAction;

		} forEach _vehiclesArray;
	}

};
