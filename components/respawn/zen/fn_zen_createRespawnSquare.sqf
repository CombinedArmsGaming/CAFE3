#include "../macros.hpp"
#define SQUARE_POLL_RATE 5

params ["_position", "_object"];

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

private _square = "VR_Area_01_square_1x1_yellow_F" createVehicleLocal _squarePos;
_square setPosASL (_squarePos vectorAdd [0,0,0.1]);

f_fnc_respawnRandoAtSquare = 
{
    params ["_square"];
    
    private _eligiblePlayers = allPlayers 
        select {!alive _x} 
        select {(_x getVariable ["f_var_lastSquareRespawnAttempt", 0]) < (CBA_missionTime - (MINIMUM_RESPAWN_DELAY + SQUARE_POLL_RATE + 1))};

    if (_eligiblePlayers isEqualTo []) exitWith {false};

    private _player = selectRandom _eligiblePlayers;
    _player setVariable ["f_var_lastSquareRespawnAttempt", CBA_missionTime, true];
    
    [ASLToAGL getPosASL _square, "Respawn square"] remoteExec ["f_fnc_allowImmediateRespawnLocal", _player];
    deleteVehicle _square;
};

f_fnc_onSquareTimeout = 
{
    params ["_square"];
    if (!alive _square) exitWith {};

    private _successfulRespawn = [_square] call f_fnc_respawnRandoAtSquare;
    if !(_successfulRespawn) then
    {
         _square setObjectTexture [0, "#(argb,8,8,3)color(0.1,0.8,0.3,1,co)"];
        [
            f_fnc_onSquareTimeout, 
            _this,
            SQUARE_POLL_RATE
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