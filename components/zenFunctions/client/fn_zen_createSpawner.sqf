#include "macros.hpp"

params ["_position"];

	["Create Spawner", 
	[
		["SIDE", "Side", [[0, 1, 2, 3], ["WEST", "EAST", "INDEPENDENT", "CIVILIAN"], 0]],
	],
	{
		params ["_dialogValues", "_args"];
		_dialogValues params ["_side"];
		_args params ["_position"];
		[_position, _side] remoteExec ["f_fnc_zen_createPlayerSpawner", 2];
		systemChat "This spawner will become active in 15 seconds.  Fine tune its position if needed.";
	}, 
	{},
	[_object]] call zen_dialog_fnc_create;

