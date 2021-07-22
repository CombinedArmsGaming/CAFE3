/*
	Script to create a new object from a logi vic.

	Object will spawn in a 30m radius around the logi vic in a space ARMA considers safe.

	Author: Joecuronium and Bubbus

	Passable arguments:
	0: Class of object to create.
	1: Logi vic to spawn object from.
	2: Gearscript to apply to the object.

	Returns:
	true iff object was sucessfully spawned (e.g. was created and did not explode).
*/

#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_logiDoSpawnVehicle);

params ["_spawnType", "_logiVic", "_gearscriptType"];

if LOGIVIC_IS_SPAWNING(_logiVic) exitWith {false};
SET_LOGIVIC_SPAWNING(_logiVic,true);


// Display system chat message to confirm spawn is commencing.
private _vicDisplayName = GET_VEHICLE_DISPLAY_NAME(_spawnType);

private _message = if (_gearscriptType isEqualTo "") then
{
	format ["Deploying '%1'...", _vicDisplayName]
}
else
{
	format ["Deploying '%1' (with '%2' gear)...", _vicDisplayName, _gearscriptType]
};

systemChat _message;
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _logiVic];


// Commence spawning - spawn vic at origin then move into position after warning delay.
private _spawnedVic = createVehicle [_spawnType, [0,0,0]]; //spawn in vehicle
_spawnedVic allowDamage false; //prevent unwanted blowing up

sleep 6;

private _spawnDir = getDir _logiVic; //teleport the spawned vic next to the spawner, copying the direction in the process
_spawnedVic setDir _spawnDir;
_spawnedVic setVehiclePosition [_logiVic, [], 30, "NONE"];

_spawnedVic spawn
{
    clearWeaponCargoGlobal _this;
    clearMagazineCargoGlobal _this;
    clearItemCargoGlobal _this;
    clearBackpackCargoGlobal _this;
};


// Wait for vic to settle in place, then enable damage to see if it will blow up regardless.
sleep 2;

_spawnedVic allowDamage true;

sleep 3;


// If vehicle has not survived then exit early.
if !(alive _spawnedVic) exitWith 
{	
	SET_LOGIVIC_SPAWNING(_logiVic,false);
	false
};


// If vehicle has survived, fill it with any specified gear.
if (_gearscriptType isNotEqualTo "") then
{
	private _logiType = GET_LOGITYPE(_logiVic);
	private _faction = GET_FACTION_DYNAMIC(_logiType);

	if (_faction isEqualTo "") then
	{
		DEBUG_PRINT_CHAT("[LOGI-VICS]: Faction not specified for logi vic '%1', defaulting to 'blu_f'.")
		_faction = "blu_f";
	};

	[_gearscriptType, _spawnedVic, _faction] call f_fnc_assignGear;
};


// Notify that spawning has completed.
SET_LOGIVIC_SPAWNING(_logiVic,false);

true