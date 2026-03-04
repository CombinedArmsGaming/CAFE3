/*
	Script to create a new object from a logi vic.

	Object will spawn in a 30m radius around the logi vic in a space ARMA considers safe.

	Author: Joecuronium and Bubbus

	Passable arguments:
	0: Class of object to create.
	1: Logi vic to spawn object from.
	2: Gearscript to apply to the object.
	3: The name of the object, to be displayed to the user.

	Returns:
	true iff object was sucessfully spawned (e.g. was created and did not explode).

*/

#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_logiDoSpawnVehicle);

params ["_spawnType", "_logiVic", "_gearOrCode", "_text"];

if LOGIVIC_IS_SPAWNING(_logiVic) exitWith {false};
SET_LOGIVIC_SPAWNING(_logiVic,true);


// Display system chat message to confirm spawn is commencing.
private _message = if (_text isNotEqualTo "") then
{
	format ["Deploying '%1'...", _text]
}
else
{
	if ((_gearOrCode isEqualTo "") or (_gearOrCode isEqualType {})) then
	{
		format ["Deploying '%1'...", GET_VEHICLE_DISPLAY_NAME(_type)]
	}
	else
	{
		format ["Deploying '%1' with '%2' gear...", GET_VEHICLE_DISPLAY_NAME(_type), _gear]
	}
};

systemChat _message;
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _logiVic];


// Commence spawning - spawn vic at origin then move into position after warning delay.
private _spawnedVic = createVehicle [_spawnType, [0,0,0]]; // Spawn in vehicle
_spawnedVic allowDamage false; // Prevent unwanted blowing up

_spawnedVic spawn
{
	sleep 3;
    clearWeaponCargoGlobal _this;
    clearMagazineCargoGlobal _this;
    clearItemCargoGlobal _this;
    clearBackpackCargoGlobal _this;
};

sleep 6;

// Teleport the spawned vic next to the spawner, copying the direction in the process
private _spawnDir = getDir _logiVic;
_spawnedVic setDir _spawnDir;
_spawnedVic setVehiclePosition [_logiVic, [], 30, "NONE"];


// Wait for vic to settle in place, then enable damage to see if it will blow up regardless.
sleep 2;

_spawnedVic allowDamage true;

_spawnedVic engineOn true;

sleep 3;


// If vehicle has not survived then exit early.
if !(alive _spawnedVic) exitWith
{
	SET_LOGIVIC_SPAWNING(_logiVic,false);
	false
};


//Create helper signs local to the player who called the funtion to help with locating the spawned entity
private _sign = "Sign_Arrow_Large_Pink_F" createVehicleLocal (getPos _spawnedVic);
private _sign2 = "Sign_Arrow_Direction_Pink_F" createVehicleLocal (getPos _logiVic);

_sign setPos (_spawnedVic modelToWorld [0,0,1]);
_sign2 setPos (_logiVic modelToWorld [0,0,1]);



// If vehicle has survived, fill it with any specified gear.
if (_gearOrCode isEqualType {}) then
{
	private _logiType = GET_LOGITYPE(_logiVic);
	private _faction = GET_FACTION_DYNAMIC(_logiType);
	[_spawnedVic, _logiVic, _logiType, _faction, _text] call _gearOrCode;
}
else
{
	if (_gearOrCode isNotEqualTo "") then
	{
		private _logiType = GET_LOGITYPE(_logiVic);
		private _faction = GET_FACTION_DYNAMIC(_logiType);

		if (_faction isEqualTo "") then
		{
			DEBUG_PRINT_CHAT("[LOGI-VICS]: Faction not specified for logi vic '%1', defaulting to 'blu_f'.")
			_faction = "blu_f";
		};

		[_gearOrCode, _spawnedVic, _faction] call f_fnc_assignGear;
	};
};


//Set the direction of the helper-signs and delete them after 10 seconds.
_dir = _sign2 getDir _sign;
_sign2 setDir _dir;

[{deleteVehicle (_this#0); deleteVehicle (_this#1);}, [_sign, _sign2], 10] call CBA_fnc_waitAndExecute;


// Notify that spawning has completed.
SET_LOGIVIC_SPAWNING(_logiVic,false);

true
