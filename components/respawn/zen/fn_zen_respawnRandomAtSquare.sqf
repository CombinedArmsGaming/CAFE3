#include "../macros.hpp"
#define SQUARE_POLL_RATE 5

params ["_position", "_object"];

private _eligiblePlayers = allPlayers 
	select {!alive _x} 
	select {(_x getVariable ["f_var_lastSquareRespawnAttempt", 0]) < (CBA_missionTime - (MINIMUM_RESPAWN_DELAY + SQUARE_POLL_RATE + 1))};

if (_eligiblePlayers isEqualTo []) exitWith {systemChat "No players are currently dead."};

private _toRespawn = [selectRandom _eligiblePlayers];

[_position, _toRespawn] call f_fnc_doRespawnSquare;