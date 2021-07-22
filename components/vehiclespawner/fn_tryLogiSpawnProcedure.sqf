/*  Script to create an action on an object which allows to spawn in new vehicles.

	Vehicle will spawn in a 30m radius around the Spawner in a space ARMA considers safe

	Author: Joecuronium

	Passable arguments:
	0: object to create action on
	1: kind of vehicle that should be able spawned in
	2: how many vehicles should be available (optional, defaults to 5)

*/
#include "macros.hpp";

params ["_spawner", "_vehicle"];

_spawner setVariable ["f_var_spawnamount", _amount, true]; //set Variables on the spawner: how much it can spawn
_spawner setVariable ["f_var_vicToSpawn", _vehicle, true]; //and what to spawn. This stays persistent on the vehicle and can be changed midmission

//script that gets run on action
_spawnscript =
{

	//only needs to know the spawner since everything else is written on the object itself on init
	params ["_spawnVic"];

	_spawnamount = (_spawnVic getVariable "f_var_spawnamount");

	if (_spawnamount == 0) exitWith {systemChat "No Vehicles left to spawn"}; //Exit script if no vehicles to spawn are left

	[_spawnVic] spawn
	{
		params ["_spawnVic"];

		_vicClass = (_spawnVic getVariable "f_var_vicToSpawn");	//get the classname to spawn
		_vicDisplayName = GET_VEHICLE_DISPLAY_NAME(_vicClass);

		systemChat format ["Spawning %1", _vicDisplayName];

		_spawnedvic = createVehicle [_vicClass, [0,0,0]]; //spawn in vehicle
		_spawnedvic allowDamage false; //prevent unwanted blowing up

		sleep 5;

		_spawndir = getDir _spawnVic; //teleport the spawned vic next to the spawner, copying the direction in the process
		_spawnedvic setDir _spawndir;
		_spawnedvic setVehiclePosition [_spawnVic, [], 30, "NONE"];

		playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _spawnedvic];

		_amount = _spawnVic getVariable "f_var_spawnamount";
		_amount = (_amount - 1);

		_spawnVic setVariable ["f_var_spawnamount", _amount, true];

		systemChat format ["%1 delivered, left to spawn: %2", _vicDisplayName, _amount]; //output the vehicles left to spawn

		sleep 10;

		_spawnedvic allowDamage true;

	};

};










_actionToBeAdded = [(format["Spawn_Vehicle_%1", _i]),(format["Spawn %1" , (getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName"))]),"",_spawnscript,{true}]call ace_interact_menu_fnc_createAction; //create the needed ace action


[_spawner, 0 , ["ACE_MainActions"], _actionToBeAdded]call ace_interact_menu_fnc_addActionToObject; //add it to the called object
