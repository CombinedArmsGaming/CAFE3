/*  Script to create an action on an object which allows to spawn in new vehicles.

	Vehicle will spawn in a 30m radius around the Spawner in a space ARMA considers safe

	Author: Joecuronium

	Passable arguments:
	0: object to create action on
	1: kind of vehicle that should be able spawned in
	2: how many vehicles should be available (optional, defaults to 5)

	Returns:
	true iff an object was successfully spawned and did not immediately die.
*/

#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_tryLogiSpawnProcedure);

params ["_logiVic", "_spawnIndex"];

private _type = _logiVic getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"type"), ""];
private _remaining = _logiVic getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"amount"), 0];
private _gear = _logiVic getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"gear"), ""];

if (_remaining <= 0) exitWith
{
	DEBUG_FORMAT2_LOG("[LOGI-VICS]: No spawns remaining for type '%1' in vic %2.",_type,_logiVic)
	false
};

private _spawnSuccess = [_type, _logiVic, _gear] call f_fnc_logiDoSpawnVehicle;

if (_spawnSuccess) then
{
	_logiVic setVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"amount"), (_remaining - 1)];
};

_spawnSuccess
