/* --------------------------------------------------------------------------------------------------------------------
	Author:		Cre8or + Bubbus
	Description:
		Continuously checks if the Zeus interface is open, and if so, initialises the Zeus UI.
	Arguments:
		(nothing)
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

#include "macros.hpp"
#include "config\macros.hpp"


CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_zeusDeployment);


// Wait for the mission to start and for the units list to be compiled
waitUntil 
{
	time > 0 && missionNamespace getVariable [MACRO_VARNAME_UI_LISTSCOMPILED, false]
};


[] spawn
{
	disableSerialization;

	while {true} do
	{
		waitUntil
		{
			uiSleep 0.15;
			!isNull (findDisplay 312)
		};
		
		// Start the custom Zeus UI
		["ui_init"] call f_fnc_zeusUI;
		
		
		waitUntil
		{
			uiSleep 0.15;
			isNull (findDisplay 312)
		};
					
	};	
	
};


[] spawn 
{
	_default_pos = [0, 0, 0];

	zeus_camPosLast = getPos player;

	while {true} do
	{
		if (alive player) then
		{
			_camPos = getPos curatorCamera;

			if (_camPos isEqualTo [0,0,0]) then
			{
				_isRemoteControlling = [player] call f_fnc_isZeusRemoteControlling;

				if (!_isRemoteControlling) then
				{
					zeus_camPosLast set [2, 0];
					[player, true] remoteExec ["f_fnc_activatePlayer", 2];
					zeusDeployed = true;
				}
				else
				{
					zeus_camPosLast = _default_pos;
				};


				// Find the ground position under the last pos
				private _posGround = ((lineIntersectsSurfaces [zeus_camPosLast, zeus_camPosLast vectorAdd [0, 0, -100], player]) param [0, []]) param [0, []];

				if (_posGround isEqualTo []) then {
					player setVehiclePosition [ASLtoATL zeus_camPosLast, [], 1, "NONE"];
				} else {
					player setPosASL _posGround;
				};

			};

			waitUntil
			{
				sleep 1;
				!(getPos curatorCamera isEqualTo [0,0,0])
			};

			[player, false] remoteExec ["f_fnc_activatePlayer", 2];
			zeusDeployed = false;

			while {!(getPos curatorCamera isEqualTo [0,0,0])} do
			{
				_camPos = getPos curatorCamera;
				player setPos _camPos;
				zeus_camPosLast = _camPos;

				sleep 0.25;

			};

		};

	};
};