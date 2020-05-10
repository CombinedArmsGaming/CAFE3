// Controls the passed AI unit until it can't fight, the player dies, the camera leaves the AI or the downtime activity halts.

#include "..\macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_remoteControlUnit);

#define SHOULD_CONTINUE f_var_downtimeExperienceActive

params ["_unit"];

if !((isNil STRING(RUNNING_ACTIVITY)) or {RUNNING_ACTIVITY isEqualTo ACTIVITY_REMOTECONTROL}) exitWith {};

// Allow the player to access the downtime dialog while controlling a unit, otherwise they'll be stuck doing it until they respawn.
_addDowntimeMenuAction =
{
    params ["_unit"];

    if !(_unit getVariable ["f_var_downtimeAddAction", false]) then
    {
        _unit addAction ["Show downtime options", { [true] call f_fnc_downtimeActivitySelector; }];
        _unit setVariable ["f_var_downtimeAddAction", true];
    };

};


if (isNull _unit or {!(isNull curatorCamera)} or {!(alive player)}) exitWith {};


if !(isNil 'bis_fnc_moduleRemoteControl_unit') then
{
    [] call f_fnc_stopRemoteControlUnit;
    sleep 1;
};


bis_fnc_moduleRemoteControl_unit = _unit;
_unit setvariable ["bis_fnc_moduleRemoteControl_owner", player, true];

// Play a wind sound to all players - the Zeus module does this too.
[format ["wind%1", ceil random 5], "bis_fnc_playsound"] call bis_fnc_mp;

// Perform the remote control.
player remoteControl _unit;
_vehicle = vehicle _unit;

if (cameraOn != _vehicle) then
{
    _vehicle switchCamera cameraView;
};

[_unit] call _addDowntimeMenuAction;


// Begin a loop to maintain control of the unit until it dies or goes unconscious.
_vehicle = vehicle _unit;
_vehicleRole = str assignedvehiclerole _unit;
_unitIsActive = (alive _unit) and {!IS_UNCONSCIOUS(_unit)};

waitUntil
{
    // Refresh control when vehicle or vehicle role changes.
    if ((((vehicle _unit) != _vehicle) or {(str assignedVehicleRole _unit) != _vehicleRole}) and {_unitIsActive}) then
    {
        player remoteControl _unit;

        _vehicle = vehicle _unit;
        _vehicleRole = str assignedVehicleRole _unit;
    };

    sleep 0.1;

    _unitIsActive = (alive _unit) and {!IS_UNCONSCIOUS(_unit)};

    (!(isNull curatorCamera)) or {cameraOn == vehicle player} or {!(alive player)} or {!_unitIsActive} or {!SHOULD_CONTINUE}

};

[] call f_fnc_stopRemoteControlUnit;

sleep 1;
