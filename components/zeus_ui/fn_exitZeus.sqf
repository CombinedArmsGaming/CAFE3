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


private _pos = getPos curatorCamera; //have to get the positions before the Zeus display closes

private _dir = getDir curatorCamera;

private _condition = {isNull (findDisplay 312)}; //Check if display is gone

private _script =
{
	params["_pos", "_dir"];

	if((cameraOn != vehicle player) || !(player getVariable ["f_var_zeusTeleportToCam", true])) exitWith {}; //Check if exiting into RC or if tp is disabled

	private _posGround = ((lineIntersectsSurfaces [_pos, _pos vectorAdd [0, 0, -100], player]) param [0, []]) param [0, []];

	player setPosASL _posGround;

	player setDir _dir;
};

[_condition, _script, [_pos, _dir]] call CBA_fnc_waitUntilAndExecute;


private _script =
{
	if((cameraOn != vehicle player) || !(player getVariable ["f_var_turnZeusInvisible", true])) exitWith {}; //Check if exiting into RC or if invisibility is disabled

	if (!cafe_ceasefire_active) then {
		player setCaptive false;
	};
	[player, true] remoteExecCall ["f_fnc_activatePlayer", 2];
};

[_condition, _script] call CBA_fnc_waitUntilAndExecute;
