#include "..\macros.hpp"

SERVER_ONLY;
RUN_AS_ASYNC(f_fnc_initControlActivityHandler);

f_arr_downtimeControlQueue = [];
#define QUEUE f_arr_downtimeControlQueue




_tellPlayerToControlUnit =
{
    params ["_player", "_unit"];

    [_unit] remoteExec ["f_fnc_remoteControlUnit", _player];

};




// Find an eligible AI unit to remotr-control during downtime.
// This function is specific to the downtime activity and should not be separated.
_findUnitToControl =
{
    // TODO :: cside
    // Cooperate with Zeus remote control by using variables and checks from that module.
    //if !(isNull (missionNamespace getvariable ["bis_fnc_moduleRemoteControl_unit", objNull])) exitWith { objNull };

    // We want to select an AI unit which is not too far away from players.  200m is a decent engagement range.
    // If we can't find any units within 200m then we fallback to more distant units.
    _sides = DOWNTIME_CONTROL_SIDES;
    _closeEnoughRadius = 200;
    _closestDistanceYet = 1000000;
    _toControl = objNull;

    // Select a random player to be our "anchor", hopefully this makes AI selection fairer.
    _alivePlayers = allPlayers select {UNIT_IS_ACTIVE(_x)};

    if ((count _alivePlayers) <= 0) then 
	{
		_alivePlayers = allPlayers;
	};

    _targetPlayer = selectRandom _alivePlayers;

    {
        scopeName "finder";

        if ((side _x) in _sides) then
        {
            // These checks are almost identical to the ones used by the Zeus module.
            if (isNull _x) exitWith {};
            if (isPlayer _x) exitWith {};
	        if (!(alive _x) or {IS_UNCONSCIOUS(_x)}) exitWith {};

	        _tempOwner = _x getVariable ["bis_fnc_moduleRemoteControl_owner", objNull];
	        if !(isNull _tempOwner) exitWith {};

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




_handleQueue = {

    _player = QUEUE select 0;

    if !(isNull _player) then
    {
        _unit = [] call _findUnitToControl;

        if !(isNull _unit) then
        {
            [_player, _unit] call _tellPlayerToControlUnit;

            _controller = objNull;
            _timeOut = time + 5;

            waitUntil
            {
                sleep 0.1;
                _controller = (_unit getVariable ["bis_fnc_moduleRemoteControl_owner", objNull]);
                (!(isNull _controller)) or {time > _timeOut}
            };

            if (_controller isEqualTo _player) then
            {
                QUEUE deleteAt 0;
            };

        };

    }
    else
    {
        QUEUE deleteAt 0;
    }

};




waitUntil
{
    if (count QUEUE > 0) then
    {
        [] call _handleQueue;
    };

    sleep 1;

    false

};
