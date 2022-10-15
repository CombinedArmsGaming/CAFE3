#include "..\respawn_macros.hpp"

/*
	Respawn locations configuration file.
	
	Be aware: because the framework uses the normal Arma Respawn system, you can use the "Respawn Position" module instead of this file.
	This file is useful for setting up respawn points with advanced behaviour (using the framework's respawn features).
	This file is also treated as a code file (unscheduled), so you can set up complex scenarios here if you know SQF.

	Also be aware: Arma Respawn will disable respawn points if the spawner object is killed or if enemies are too close (~100m).

	Available configuration commands:
	(All commands are also usable in the mission editor, in the "Init" field.)

	[<An Object>, "Optional Name", <Optional Respawn Target>, {Creation Criterion}, {Removal Criterion}, <Is Repeatable>] call f_fnc_setRespawnLocation;
	-	Sets an object as a respawn object.
*/

// Example: creates a respawn for everyone in every faction, 200m in the air.
// [[0,0,200], "Chaos Parachute Zone"] call f_fnc_setRespawnLocation;


// Example: creates a respawn for BLUFOR on their default logi truck.
// [logi_truck, "BLUFOR Logi Truck", west] call f_fnc_setRespawnLocation;


// Advanced example: creates a respawn for BLUFOR at the OPFOR spawn marker, which only appears when BLUFOR logi truck is killed.
//
// _isCreatedWhen = {!(alive logi_truck)};
// _isRemovedWhen = {false}; // Is never removed.
// ["respawn_east", "LOGI REVENGE SPAWNPOINT", west, _isCreatedWhen, _isRemovedWhen] call f_fnc_setRespawnLocation;


// Advanced example: creates a respawn for BLUFOR which only appears whenever the logi truck is close to it.
//
// _myRespawnPosition = [300, 300, 0]; // Map position (meters): east, north, height.
// _isCreatedWhen = { (logi_truck distance _myRespawnPosition) <= 50 };
// _isRemovedWhen = { (logi_truck distance _myRespawnPosition) > 50 };
// _isRepeatable = true;
// ["respawn_east", "Logi close enough spawnpoint", west, _isCreatedWhen, _isRemovedWhen, _isRepeatable] call f_fnc_setRespawnLocation;