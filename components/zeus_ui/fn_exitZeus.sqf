/* --------------------------------------------------------------------------------------------------------------------
	Author:		Joecuronium
	Description:
		Handles Zeus exiting the Zeus display
	Arguments:
		(nothing)
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */


#include "macros.hpp"

CLIENT_ONLY;

if(!(player getVariable ["f_var_isZeus",false])) exitWith {}; //Fallback in case the script execution is run on the wrong machine

if(player getVariable ["f_var_zeusTeleportToCam", true]) then
{
	
	private _pos = getPos curatorCamera;

	private _dir = getDir curatorCamera;

	private _posGround = ((lineIntersectsSurfaces [_pos, _pos vectorAdd [0, 0, -100], player]) param [0, []]) param [0, []];

	player setPosASL _posGround;

	player setDir _dir;

	player setCaptive false;

	[player, true] remoteExecCall ["f_fnc_activatePlayer", 2]; 
};


if(player getVariable ["f_var_turnZeusInvisible", true]) then
{
	player setCaptive false;
	[player, true] remoteExecCall ["f_fnc_activatePlayer", 2]; 
};