#include "macros.hpp"

/*
 * Author: Poulern
 * Creates a vehicle and locks it and removes whatever is inside of it and locks it for players
 *
 * Arguments:
 * 0: Vehicle type, vehicle classname
 * 1: Position, anything, also direction
 * 2: lock, 0 = unlocked, 1 = locked, 2 = default 3 = locked for players
 *
 * Return Value:
 * Vehicle
 *
 */

params ["_position", "_vehicletype", ["_locknumber",0], "_dir"];

_posdir = _position call f_fnc_getDirPos;
_spawnpos = _posdir select 0;

_isAir = _vehicletype isKindOf "Air";
_placement = "NONE";

if (_isAir) then {
    _spawnpos set [2, 100];
    _placement = "FLY";
};

_vehicle = createVehicle  [_vehicletype, _spawnpos, [], 15, _placement];
_vehicle setDir _dir;

_vehicle lock _locknumber;
_vehicle setUnloadInCombat [false, false];

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

_returnList = [_vehicle, _isAir];

_returnList
