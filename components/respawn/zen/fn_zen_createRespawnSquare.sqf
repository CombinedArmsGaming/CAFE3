#include "../macros.hpp"

params ["_position", "_object"];

private _square = "VR_Area_01_square_1x1_yellow_F" createVehicleLocal (ASLToAGL _position);

f_fnc_respawnRandoAtSquare = 
{
    params ["_square"];
    
    private _eligiblePlayers = allPlayers 
        select {!alive _x} 
        select {(_x getVariable ["f_var_lastSquareRespawnAttempt", 0]) < (CBA_missionTime - 1)};

    private _eligibleCount = count _eligiblePlayers;
    if (_eligibleCount <= 0) exitWith {false};

    private _player = _eligiblePlayers # (floor random count _eligiblePlayers);
    _player setVariable ["f_var_lastSquareRespawnAttempt", CBA_missionTime, true];
    
    [ASLToAGL getPosASL _square, "Respawn square"] remoteExec ["f_fnc_allowImmediateRespawnLocal", _player];
    deleteVehicle _square;
};

f_fnc_onSquareTimeout = 
{
    params ["_square"];
    if (!alive _square) exitWith {};

    _square setObjectTexture [0, "#(argb,8,8,3)color(0.1,0.8,0.3,1,co)"];
    private _successfulRespawn = [_square] call f_fnc_respawnRandoAtSquare;

    if !(_successfulRespawn) then
    {
        [
            f_fnc_onSquareTimeout, 
            _this,
            5
        ] call CBA_fnc_waitAndExecute;
    }
    else
    {        
        _square setObjectTexture [0, "#(argb,8,8,3)color(0.5,0.2,0.1,1,co)"];
    };
};

[
    {!alive _this},
    {},
    _square,
    5,
    f_fnc_onSquareTimeout
] call CBA_fnc_waitUntilAndExecute;

systemChat "Respawn square will activate in 5s.  Delete the square to cancel.";