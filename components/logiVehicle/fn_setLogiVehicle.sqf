/*
	Script to initialise a vehicle as a logi vic.  Allows the spawning of configured objects from it by authorised players.

	Author: Bubbus and Joecuronium

	Passable arguments:
	0: object to create action on
	1: logi type - as defined in the logi configuration.

*/

#include "macros.hpp"

SERVER_ONLY;
RUN_AS_ASYNC(f_fnc_setLogiVehicle);

params ["_vehicle", "_logiType"];

if !IS_REGISTERED_LOGI(_logiType) exitWith
{
	DEBUG_FORMAT2_LOG("[LOGI-VICS]: Tried to apply an unknown logi config '%1' to a vehicle '%2'.",_logiType,_vehicle)
};


private _existingLogiType = GET_LOGITYPE(_vehicle);

if ((_existingLogiType isNotEqualTo "") and {_existingLogiType isNotEqualTo _logiType}) exitWith
{
	DEBUG_FORMAT2_LOG("[LOGI-VICS]: Tried to apply logi config '%1' to a vehicle already configured as '%2'.  This is not currently supported.",_logiType,_existingLogiType)
};


private _vehiclesArray = GET_VEHICLES_DYNAMIC(_logiType);

SET_LOGITYPE(_vehicle,_logiType);

{
	private _vicType = _x#0;
	private _amount = _x#1;
	private _gear = _x param [2, ""];
	private _text = _x param [3, ""];

	_vehicle setVariable [LOGIVIC_VAR_DYNAMIC(_forEachIndex,"type"), _vicType, true];
	_vehicle setVariable [LOGIVIC_VAR_DYNAMIC(_forEachIndex,"amount"), _amount, true];
	_vehicle setVariable [LOGIVIC_VAR_DYNAMIC(_forEachIndex,"gear"), _gear, true];
	_vehicle setVariable [LOGIVIC_VAR_DYNAMIC(_forEachIndex,"text"), _text, true];

} forEach _vehiclesArray;


// If this vehicle was not already a logi vic, add the user actions and ACE config to it.
if (_existingLogiType isEqualTo "") exitWith
{
	[_vehicle, -10] call ace_refuel_fnc_makeSource;
	_vehicle setVariable ['ace_isRepairVehicle', true, true];
	[_vehicle, 10000] call ace_rearm_fnc_makeSource;

	_vehicle spawn
	{
		while {alive _this} do
		{
			_this setVariable ["ace_rearm_currentSupply", 10000, true];
			sleep 10;
		};

	};

	// Wait a while to ensure that networked vars have propagated.
	sleep 2;

	_this remoteExec ["f_fnc_setLogiVehiclePlayer", 0, _vehicle];
};
