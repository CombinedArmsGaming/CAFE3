/*  Script to create an action on an object which allows to spawn in new vehicles.

	Vehicle will spawn in a 30m radius around the Spawner in a space ARMA considers safe

	Author: Joecuronium

	Passable arguments:
	0: object to create action on
	1: kind of vehicle that should be able spawned in
	2: how many vehicles should be available (optional, defaults to 5)

*/	
#include "macros.hpp";


params ["_spawner", "_vehicle", ["_amount",5]];




_spawner setVariable["f_var_spawnamount", _amount, true]; //set Variables on the spawner: how much it can spawn
_spawner setVariable["f_var_vicToSpawn", _vehicle, true]; //and what to spawn. This stays persistent on the vehicle and can be changed midmission


_spawnscript = {					//script that gets run on action

	params ["_spawnvic"];			//only needs to know the spawner since everything else is written on the object itself on init




	_spawnamount = (_spawnvic getVariable "f_var_spawnamount");				

	if (_spawnamount == 0) exitWith {systemChat "No Vehicles left to spawn"}; //Exit script if no vehicles to spawn are left


	

	[_spawnvic] spawn {

		params["_spawnvic"];

		

		_vicClass = (_spawnvic getVariable "f_var_vicToSpawn");	//get the classname to spawn

		systemChat format ["Spawning %1", (getText(configFile >> "CfgVehicles" >> _vicClass >> "displayName"))];

		_spawnedvic = createVehicle [_vicClass, [0,0,0]];	//spawn in vehicle

		_spawnedvic allowDamage false;						//prevent unwanted blowing up

		sleep 5;

		_spawndir = getDir _spawnvic;						//teleport the spawned vic next to the spawner, copying the direction in the process
		_spawnedvic setDir _spawndir;
		_spawnedvic setVehiclePosition [_spawnvic, [], 30, "NONE"];

		playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss",_spawnedvic];
		
		_amount = _spawnvic getVariable "f_var_spawnamount";     
		_amount = (_amount - 1);	

		_spawnvic setVariable["f_var_spawnamount", _amount, true];       

		systemChat format ["%1 delivered, left to spawn: %2", (getText(configFile >> "CfgVehicles" >> _vicClass >> "displayName")), _amount]; //output the vehicles left to spawn




		sleep 10;

		_spawnedvic allowDamage true; 


	};


};










_actionToBeAdded = [(format["Spawn_Vehicle_%1", _i]),(format["Spawn %1" , (getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName"))]),"",_spawnscript,{true}]call ace_interact_menu_fnc_createAction; //create the needed ace action


[_spawner, 0 , ["ACE_MainActions"], _actionToBeAdded]call ace_interact_menu_fnc_addActionToObject; //add it to the called object




