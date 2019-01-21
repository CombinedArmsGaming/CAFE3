//	Zeus extensions for CA, by Bubbus.
//
//	This function is called from f_fnc_registerZeusPlayer.
//

#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_zeusDeployment);


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
				[player, true] remoteExec ["f_fnc_activateZeusPlayer", 2];
				zeusDeployed = true;
			}
			else
			{
				zeus_camPosLast = _default_pos;
			};

			player setVehiclePosition [zeus_camPosLast, [], 1, "NONE"];

		};

		waitUntil
		{
			sleep 1;
			!(getPos curatorCamera isEqualTo [0,0,0])
		};

		[player, false] remoteExec ["f_fnc_activateZeusPlayer", 2];
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
