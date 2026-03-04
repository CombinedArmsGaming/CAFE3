/*
	Create a respawn square at the given position and respawn the given players at it.
	Run on client of zeus who placed the square

	Arguments:
		0: <POSITION> The position of the square, given by the ZEN module
		1: <ARRAY or STRING> Array containing players to be spawned at the square, or "RANDOM" if the square should spawn a random player
			If given "RANDOM", the square will continue to poll for a dead player if one is not found when it is first placed
*/

#include "../macros.hpp"
#define SQUARE_POLL_RATE 5

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

f_fnc_respawnRandoAtSquare = 
{
    params ["_square"];
    
    private _eligiblePlayers = allPlayers 
        select {!alive _x} 
        select {(_x getVariable ["f_var_lastSquareRespawnAttempt", 0]) < (CBA_missionTime - (MINIMUM_RESPAWN_DELAY + SQUARE_POLL_RATE + 1))};

    if (_eligiblePlayers isEqualTo []) exitWith {DEBUG_PRINT_LOG("[RESPAWN_ZEN] No eligible players for spawning at square"); false};

    private _player = selectRandom _eligiblePlayers;
	DEBUG_FORMAT1_LOG("[RESPAWN_ZEN] Spawning randomly chosen player: %1 at square", _player);
    _player setVariable ["f_var_lastSquareRespawnAttempt", CBA_missionTime, true];
    
    [ASLToAGL getPosASL _square, "Respawn square"] remoteExec ["f_fnc_allowImmediateRespawnLocal", _player];

	// Successful spawn
	true
};

f_fnc_onSquareTimeout = 
{
	params ["_square", "_toRespawn"];
	if (!alive _square) exitWith {DEBUG_PRINT_LOG("[RESPAWN_ZEN] Square timed out dead. Not respawning.")};

	DEBUG_FORMAT1_LOG("[RESPAWN_ZEN] Square timed out alive! Respawning: %1", _toRespawn);

	private _successfulRespawn = false;
	if (_toRespawn isEqualTo "RANDOM") then {
		// Attempt to spawn a random player
		_successfulRespawn = [_square] call f_fnc_respawnRandoAtSquare;
		// If nobody was spawned, change the square color and keep polling for a dead player
		if !(_successfulRespawn) then
		{
			_square setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.1,0.8,0.3,1,co)"];
			[
				f_fnc_onSquareTimeout, 
				_this,
				SQUARE_POLL_RATE
			] call CBA_fnc_waitAndExecute;
		};
	} else {
		if (_toRespawn isEqualType []) then {
			// Attempt to spawn every player in the list
			{
				if (!alive _x) then {
					_x setVariable ["f_var_lastSquareRespawnAttempt", CBA_missionTime, true];
					
					[ASLToAGL getPosASL _square, "Respawn square"] remoteExec ["f_fnc_allowImmediateRespawnLocal", _x];

					_successfulRespawn = true;
				};
			} forEach _toRespawn;

			// If no players were spawned, notify Zeus and delete square
			if (!_successfulRespawn) then {
				systemChat "Selected player(s) are already alive";
				deleteVehicle _square;
			};
		} else {
			private _str = format ["[RESPAWN_ZEN] Unrecognized _toRespawn given to doRespawnSquare: %1", _toRespawn];
			diag_log _str;
			systemChat _str;
		};
	};

	// If a player was successfully spawned, edit the square to make it clear
	if (_successfulRespawn) then {
		// Change the square color to notify Zeus that it is active
		_square setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.5,0.2,0.1,1,co)"];
		[_square] call f_fnc_removeObjectsFromAllZeuses;

		// Delete the square after the player(s) have spawned
		[
			{deleteVehicle _this},
			_square,
			MINIMUM_RESPAWN_DELAY
		] call CBA_fnc_waitAndExecute;
	};
};

[
	{!alive (_this # 0)},
	{},
	[_square, _toRespawn],
	5,
	f_fnc_onSquareTimeout
] call CBA_fnc_waitUntilAndExecute;

systemChat "Respawn square will activate in 5s.  Delete the square to cancel.";