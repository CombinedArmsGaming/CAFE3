/* 
	Author:		Cre8or + Bubbus
	Modified by: Joecuronium
	Description:
		Depreciated! In here for legacy reasons, will be removed on release!
	Arguments:
		(nothing)
	Returns:
		(nothing)
*/


#include "macros.hpp"

CLIENT_ONLY;

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
				_camDir = getDir curatorCamera;
				player setDir _camDir;

				sleep 0.25;

			};

		};

	};
};