#include "../macros.hpp"
#define SQUARE_POLL_RATE 5


private _onConfirm = {
	params ["_values", "_args"];
	// These are passed at the end of this file and then through the dialog to here
	_args params ["_position", "_object"];

	// ZEN gives an array of responses, we only care about the first
	private _toRespawn = _values # 0;

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
			_x setVariable ["f_var_lastSquareRespawnAttempt", CBA_missionTime, true];
			
			[ASLToAGL getPosASL _square, "Respawn square"] remoteExec ["f_fnc_allowImmediateRespawnLocal", _x];
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
};

// Pass position and object as arguments to the dialog
["Respawn at cursor", _onConfirm, _this] call f_fnc_selectFromDeadPlayers;