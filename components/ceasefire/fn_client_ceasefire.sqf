/* --------------------------------------------------------------------------------------------------------------------
	Author:		Cre8or
	Description:
		Handles the Ceasefire functionality on the client.
		Initiated by fn_ceasefire.

		A negative timestamp indicates that the countdown shall not be shown.
	Arguments:
		0:      <BOOLEAN>	Whether or not ceasefire should be active (optional, default: true)
		1:	<NUMBER>	Timestamp for when the ceasefire should end (optional, default: -1)
		2:	<STRING>	Justification for the ceasefire (e.g. "Tech issues") (optional, default: "")
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

#include "config\macros.hpp"

// Fetch our params
params [
	["_enabled", true, [true]],
	["_endTime", -1, [-1]],
	["_justification", "", [""]]
];

// If this function is not executing on a player machine, exit
if (!hasInterface) exitWith {};





// Set up some variables
private _ply = player;
if (isNil "cafe_ceasefire_playerFireEH") then {cafe_ceasefire_playerFireEH = -1};





// Toggle the ceasefire UI
_this call f_fnc_client_ceasefireUI;





// CLientside ceasefire handling
_ply removeEventHandler ["FiredMan", cafe_ceasefire_playerFireEH];
cafe_ceasefire_playerFireEH = -1;

if (_enabled) then {

	// Remove projectiles
	cafe_ceasefire_playerFireEH = _ply addEventHandler ["FiredMan", {
		params ["_unit", "", "", "", "", "", "_projectile", ""];

		deleteVehicle _projectile;
	}];
};

// Invincibility
_ply allowDamage (!_enabled);

// Captivity
if !(_ply getVariable ["f_var_turnZeusInvisible", false]) then {
	_ply setCaptive _enabled;
};
