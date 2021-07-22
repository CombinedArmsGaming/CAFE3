/*
	Script to create an action on an object which allows to spawn in new vehicles.

	Vehicle will spawn in a 30m radius around the Spawner in a space ARMA considers safe

	Author: Joecuronium

	Passable arguments:
	0: object to create action on
	1: kind of vehicle that should be able spawned in
	2: how many vehicles should be available (optional, defaults to 5)

*/
#include "macros.hpp";

params ["_vicToSpawn", "_objToSpawnNear"];

_vicDisplayName = GET_VEHICLE_DISPLAY_NAME(_vicToSpawn);

systemChat format ["Spawning %1", _vicDisplayName];

_spawnedvic = createVehicle [_vicToSpawn, [0,0,0]]; //spawn in vehicle
_spawnedvic allowDamage false; //prevent unwanted blowing up

sleep 5;

_spawndir = getDir _objToSpawnNear; //teleport the spawned vic next to the spawner, copying the direction in the process
_spawnedvic setDir _spawndir;
_spawnedvic setVehiclePosition [_objToSpawnNear, [], 30, "NONE"];

playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _spawnedvic];

sleep 10;

_spawnedvic allowDamage true;










_actionToBeAdded = [(format["Spawn_Vehicle_%1", _i]),(format["Spawn %1" , (getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName"))]),"",_spawnscript,{true}]call ace_interact_menu_fnc_createAction; //create the needed ace action


[_spawner, 0 , ["ACE_MainActions"], _actionToBeAdded]call ace_interact_menu_fnc_addActionToObject; //add it to the called object
