#include "..\macros.hpp"

#define SHOULD_CONTINUE f_var_downtimeExperienceActive

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeSpectate);



// Find an eligible AI unit to remotr-control during downtime.
// This function is specific to the downtime activity and should not be separated.
_findUnitToControl =
{
    // Cooperate with Zeus remote control by using variables and checks from the module.
    if !(isNull (missionNamespace getvariable ["bis_fnc_moduleRemoteControl_unit", objNull])) exitWith { objNull };

    // We want to select an AI unit which is not too far away from players.  200m is a decent engagement range.
    // If we can't find any units within 200m then we fallback to more distant units.
    _sides = DOWNTIME_CONTROL_SIDES;
    _closeEnoughRadius = 200;
    _closestDistanceYet = 1000000;
    _toControl = objNull;

    // Select a random player to be our "anchor", hopefully this makes AI selection fairer.
    // BUB 2020-02-25 TODO :: Make this exclude players who are down or in spectator.
    _alivePlayers = allPlayers select {alive _x};

    if ((count _alivePlayers) <= 0) exitWith { objNull };

    _targetPlayer = selectRandom _alivePlayers;

    {
        scopeName "finder";

        if ((side _x) in _sides) then
        {
            // These checks are almost identical to the ones used by the Zeus module.
            if (isNull _x) exitWith {};
            if (isPlayer _x) exitWith {};
	        if (!(alive _x) or {_x getVariable ["ACE_isUnconscious", false]}) exitWith {};

	        _tempOwner = _x getVariable ["bis_fnc_moduleRemoteControl_owner", objNull];
	        if (!isNull _tempOwner and {_tempOwner in allPlayers}) exitWith {};

	        if (isUavConnected vehicle _x) exitWith {};

            // Distance check, make a note of the closest unit we've found.
            _distance = _x distance2D _targetPlayer;

            if (_closestDistanceYet > _distance) then
            {
                _toControl = _x;
                _closestDistanceYet = _distance;
            };

            // If the unit is within our engagement range, select that unit immediately.
            if (_distance <= _closeEnoughRadius) then
            {
                _toControl = _x;
                breakOut "finder";
            };

        };

    } forEach allUnits;

    _toControl
};



// Make sure the player has stopped controlling any AI and all relevant variables are cleared.
// This function is specific to the downtime activity and should not be separated.
_stopControllingUnits =
{
    if (isNil 'bis_fnc_moduleRemoteControl_unit') exitWith {};

    _unit = bis_fnc_moduleRemoteControl_unit;

    objNull remoteControl _unit;
    _unit setVariable ["bis_fnc_moduleRemoteControl_owner", nil, true];
    bis_fnc_moduleRemoteControl_unit = nil;

    player switchCamera cameraView;

};




// Controls the passed AI unit until it can't fight, the player dies, the camera leaves the AI or the downtime activity halts.
// This function is intended to block execution: use 'call', not 'spawn'.
// This function is specific to the downtime activity and should not be separated.
_controlUnit =
{
    params ["_unit"];

    if (isNull _unit or {!(isNull curatorCamera)} or {!(alive player)}) exitWith {};

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

    // Begin a loop to maintain control of the unit until it dies or goes unconscious.
    _vehicle = vehicle _unit;
	_vehicleRole = str assignedvehiclerole _unit;
	_rating = rating player;
    _unitIsActive = (alive _unit) and {!(_unit getVariable ["ACE_isUnconscious", false])};

	waitUntil
    {
    	// Refresh control when vehicle or vehicle role changes.
    	if ((vehicle _unit != _vehicle or {str assignedVehicleRole _unit != _vehicleRole}) and {_unitIsActive}) then
        {
    		player remoteControl _unit;

    		_vehicle = vehicle _unit;
    		_vehicleRole = str assignedVehicleRole _unit;
    	};

    	sleep 0.1;

        _unitIsActive = (alive _unit) and {!(_unit getVariable ["ACE_isUnconscious", false])};

    	!(isNull curatorCamera) or {cameraOn == vehicle player} or {!(alive player)} or {!_unitIsActive} or {!SHOULD_CONTINUE}

	};

    // Unit is down or player is dead - release control.
    objNull remoteControl _unit;

    sleep 0.1;

    player switchCamera cameraView;

    // If the control ended because the player died, don't clear the control vars - this allows control to return to this unit when the player is back.
    if !(_unitIsActive and {!(alive player)}) then
    {
        _unit setVariable ["bis_fnc_moduleRemoteControl_owner", nil, true];
    	bis_fnc_moduleRemoteControl_unit = nil;
    };

};




if !(SHOULD_CONTINUE) exitWith {};

while {SHOULD_CONTINUE} do
{
    _toControl = objNull;

    // Unfortunately control can't occur when player has died - it screws everything up.  Wait for player to respawn.
    waitUntil { (alive player) or {!SHOULD_CONTINUE} };

    if !(SHOULD_CONTINUE) exitWith {};

    if (isNil 'bis_fnc_moduleRemoteControl_unit') then
    {
        _firstRun = true;

        waitUntil
        {
            if !(_firstRun) then { titleText ["Still trying to find a unit...", "PLAIN", 0.15, true, true]; uiSleep 1; };
            _firstRun = false;

            _toControl = [] call _findUnitToControl;

            !((isNull _toControl) and {SHOULD_CONTINUE})

        };

    }
    else
    {
        _toControl = bis_fnc_moduleRemoteControl_unit;
    };

    if !(SHOULD_CONTINUE) exitWith {};

    [_toControl] call _controlUnit;

};

[] call _stopControllingUnits;
