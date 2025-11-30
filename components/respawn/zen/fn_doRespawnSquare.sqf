/*
	Create a respawn square at the given position and respawn the given players at it.
	Run on client of zeus who placed the square

	Arguments:
		0: <POSITION> The position of the square, given by the ZEN module
		1: <ARRAY> Array containing players to be spawned at the square
*/

#include "../macros.hpp"

params ["_position", "_toRespawn"];

private _squarePos = _position;

if !(isNull curatorCamera) then
{
	private _camPos = getPosASL curatorCamera;
	private _results = lineIntersectsSurfaces [_camPos, _position, objNull, objNull, true, 1];

	if (count _results > 0) then
	{
		_squarePos = _results # 0 # 0;
	};
};

// Spawn the square
private _square = "VR_Area_01_square_1x1_yellow_F" createVehicle _squarePos;
_square setPosASL (_squarePos vectorAdd [0,0,0.1]);
[_square] call f_fnc_addObjectsToAllZeuses;

f_fnc_onSquareTimeout = 
{
	params ["_square", "_toRespawn"];
	if (!alive _square) exitWith {DEBUG_PRINT_LOG("[RESPAWN_ZEN] Square timed out dead. Not respawning.")};

	DEBUG_FORMAT1_LOG("[RESPAWN_ZEN] Square timed out alive! Respawning: %1", _toRespawn);
	{
		if (!alive _x) then {
			_x setVariable ["f_var_lastSquareRespawnAttempt", CBA_missionTime, true];
			
			[ASLToAGL getPosASL _square, "Respawn square"] remoteExec ["f_fnc_allowImmediateRespawnLocal", _x];
		};
	} forEach _toRespawn;

	// Change the square color to notify Zeus that it is active
	_square setObjectTexture [0, "#(argb,8,8,3)color(0.5,0.2,0.1,1,co)"];
	[_square] call f_fnc_removeObjectsFromAllZeuses;

	// Delete the square after the player(s) have spawned
	[
		{deleteVehicle _this},
		_square,
		MINIMUM_RESPAWN_DELAY
	] call CBA_fnc_waitAndExecute;
};

[
	{!alive (_this # 0)},
	{},
	[_square, _toRespawn],
	5,
	f_fnc_onSquareTimeout
] call CBA_fnc_waitUntilAndExecute;

systemChat "Respawn square will activate in 5s.  Delete the square to cancel.";