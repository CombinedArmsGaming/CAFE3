#include "macros.hpp"

params [ "_veh", "_ply" ];

RUN_LOCAL_TO(_ply,f_fnc_playerPushVehicle,_this);

if ( !isNull _veh ) then
{
	_pushDir = eyeDirection _ply;
	_pushPos = getPos _ply;

	[_veh, _pushDir, _pushPos] remoteExec ["f_fnc_pushVehicle", _veh];
};
