/*
	Attempt to spawn an object at a logi vic.  Decrement the remaining stock only if the object survives the spawning process.

	Author: Joecuronium and Bubbus

	Passable arguments:
	0: Logi vic to use to spawn an object.
	1: The spawn index of the object to use - ordered by config order.

	Returns:
	true iff an object was successfully spawned and did not immediately die.

*/

#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_tryLogiSpawnProcedure);

params ["_logiVic", "_spawnIndex"];

private _type = _logiVic getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"type"), ""];
private _remaining = _logiVic getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"amount"), 0];
private _gear = _logiVic getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"gear"), ""];
private _text = _logiVic getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"text"), ""];

if (_remaining <= 0) exitWith
{
	DEBUG_FORMAT2_LOG("[LOGI-VICS]: No spawns remaining for type '%1' in vic %2.",_type,_logiVic)
	false
};

private _spawnSuccess = [_type, _logiVic, _gear, _text] call f_fnc_logiDoSpawnVehicle;

if (_spawnSuccess) then
{
	_logiVic setVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"amount"), (_remaining - 1), true];
};

_spawnSuccess
