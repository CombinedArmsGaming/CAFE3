/* --------------------------------------------------------------------------------------------------------------------
	Author:		Cre8or
	Description:
		Handles the Ceasefire functionality on the server. Processes the request and broadcasts the associated
		variables to every other machine (JIP enabled). The ceasefire last for the specified duration, before
		terminating automatically.

		NOTE: Setting the duration to 0 will make the ceasefire last indefinitely. Note that you will have to
		manually deactivate it in this mode.
	Arguments:
		0:      <BOOLEAN>	Whether or not ceasefire should be active (optional, default: true)
		1:	<NUMBER>	Duration of the ceasefire, in seconds (optional, default: 0)
		2:	<STRING>	Justification for the ceasefire (e.g. "Tech issues") (optional, default: "")
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

#include "config\macros.hpp"

// Fetch our params
params [
	["_enabled", true, [true]],
	["_duration", 0, [0]],
	["_justification", "", [""]]
];

// If this function is not executing on the server, exit
if (!isServer) exitWith {};





// Set up some variables
if (isNil "cafe_ceasefire_active") then {cafe_ceasefire_active = false};
if (isNil "cafe_ceasefire_server_EH") then {cafe_ceasefire_server_EH = -1};
if (isNil "cafe_ceasefire_server_sideRelations") then {cafe_ceasefire_server_sideRelations = []};
private _ceasefireStateChanged = (cafe_ceasefire_active != _enabled);

cafe_ceasefire_active = _enabled;
cafe_ceasefire_endTime = [-1, CBA_missionTime + _duration] select (_duration > 0);





// Define some macros
#define MACRO_FNC_ALLSIDERELATIONS(THISSIDE)				 \
	[THISSIDE, [east,       THISSIDE getFriend east]],		 \
	[THISSIDE, [resistance, THISSIDE getFriend resistance]],	 \
	[THISSIDE, [west,       THISSIDE getFriend west]],		 \
	[THISSIDE, [civilian,   THISSIDE getFriend civilian]]





// Relay the ceasefire to all clients (JIP compatible)
[_enabled, cafe_ceasefire_endTime, _justification] remoteExecCall ["f_fnc_client_ceasefire", 0, "cafe_ceasefire"];
publicVariable "cafe_ceasefire_active";





if (_ceasefireStateChanged) then {

	// Enforce the ceasefire via side relations
	if (_enabled) then {

		cafe_ceasefire_server_sideRelations = [
			MACRO_FNC_ALLSIDERELATIONS(east),
			MACRO_FNC_ALLSIDERELATIONS(resistance),
			MACRO_FNC_ALLSIDERELATIONS(west),
			MACRO_FNC_ALLSIDERELATIONS(civilian)
		];

		private _allSides = [east, resistance, west, civilian];
		private "_sideX";
		{
			_sideX = _x;
			{
				_sideX setFriend [_x, 1];
			} forEach _allSides;
		} forEach _allSides;

	// Otherwise, restore the previous side relations
	} else {

		{
			_x params ["_side", "_state"];
			_side setFriend _state;
		} forEach cafe_ceasefire_server_sideRelations;
	};
};





// Keep track of the countdown
removeMissionEventHandler ["EachFrame", cafe_ceasefire_server_EH];

if (_duration > 0) then {
	cafe_ceasefire_server_EH = addMissionEventHandler ["EachFrame", {

		private _countdown = cafe_ceasefire_endTime - CBA_missionTime;

		// Terminate the ceasefire and broadcast to all clients
		if (_countdown < 0) then {
			removeMissionEventHandler ["EachFrame", cafe_ceasefire_server_EH];
			cafe_ceasefire_server_EH = -1;
			cafe_ceasefire_active = false;

			// Restore the previous side relations
			{
				_x params ["_side", "_state"];
				_side setFriend _state;
			} forEach cafe_ceasefire_server_sideRelations;

			[false] remoteExecCall ["f_fnc_client_ceasefire", 0, "cafe_ceasefire"];
			publicVariable "cafe_ceasefire_active";
		};
	}];
} else {
	cafe_ceasefire_server_EH = -1;
};
