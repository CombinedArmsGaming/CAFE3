/*
	Script to initialise a vehicle as a logi vic.  Allows the spawning of configured objects from it by authorised players.

	Author: Bubbus and Joecuronium

	Passable arguments:
	0: object to create action on
	1: logi type - as defined in the logi configuration.
*/

#include "macros.hpp"

CLIENT_ONLY;

params ["_vehicle", "_logiType"];

if !IS_REGISTERED_LOGI(_logiType) exitWith
{
	DEBUG_FORMAT2_LOG("[LOGI-VICS]: Tried to apply an unknown logi config '%1' to a vehicle '%2'.",_logiType,_vehicle)
};

_this call f_fnc_addLogiSpawnActions;
