/*
	Check if logi vehicle is currently capable of spawning the object stored at the provided logi object index.
	The logi vehicle must have been initialised, must not currently be spawning anything and it must currently not have run out of stock of the object.

	Author: Bubbus

	Passable arguments:
	0: Logi vehicle to test capability upon
	1: The logi object index to test.  This is ordered identically to configuration.

	Returns:
	true iff logi vehicle is capable of spawning an object at the given object index at the current time.

*/

#include "macros.hpp"

params ["_logiVic", "_spawnIndex"];

if LOGIVIC_IS_SPAWNING(_logiVic) exitWith {false};

private _remaining = _logiVic getVariable [LOGIVIC_VAR_DYNAMIC(_spawnIndex,"amount"), 0];

if (_remaining <= 0) exitWith {false};

true