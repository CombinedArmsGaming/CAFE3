/*
	Check if logi vehicle is currently capable of spawning the provided object type.
	The logi vehicle must have been given the object type in its configuration, and it must currently not have run out of stock of the object type.

	Author: Bubbus

	Passable arguments:
	0: logi vehicle to test capability upon
	1: type of object to check if the logi vehicle can spawn

	Returns:
	true iff logi vehicle is capable of spawning the given object type.

*/

#include "macros.hpp";

params ["_vehicle", "_spawnType"];

private _logiType = GET_LOGITYPE(_vehicle);
private _logiVics = GET_VEHICLES_DYNAMIC(_logiType);

if (_logiVics isEqualTo []) exitWith
{
	DEBUG_FORMAT1_LOG("[LOGI-VICS]: Invalid logi type '%1'.",_logiType)
	false
};

private _vicArrays = GET_VEHICLES_DYNAMIC(_logiType);
private _vicIndex = _vicArrays findIf {_x#0 isEqualTo _spawnType};

if (_vicIndex < 0) exitWith {false}

private _vicArray = _vicArrays # _vicIndex;
private _remaining
