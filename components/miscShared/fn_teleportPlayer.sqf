
#include "macros.hpp"
RUN_AS_ASYNC(f_fnc_teleportPlayer);

// 2020-06-02 TODO :: Add "loud/quiet" parameter to provide feedback to the user / target depending on current state.

params ["_unit", "_posAtlOrObject", ["_onFailure", {}]];


if (typeName _posAtlOrObject == typeName []) exitWith
{
    DEBUG_FORMAT1_LOG("[TeleportPlayer] Target is a position: moving to %1 (ATL).",_posAtlOrObject)
    _unit setPosATL _posAtlOrObject;
};


if !(typeName _posAtlOrObject == typeName objNull) exitWith
{
    DEBUG_FORMAT1_LOG("[TeleportPlayer] f_fnc_teleportPlayer was called with %1 which is not an array or object.",_posAtlOrEntity)
    _this call _onFailure;
};


_object = _posAtlOrObject;

if !(_object isKindOf "AllVehicles") exitWith
{
    DEBUG_FORMAT1_LOG("[TeleportPlayer] Target is a non-vehicle object: moving to location of %1.",_object)
    _unit setPosATL (getPosATL _object);
};


if (_object isKindOf "Man") exitWith
{
    _vehicle = vehicle _object;
    _success = false;

    _timeOut = time + 30;

    waitUntil
    {
        if (!alive _object) exitWith {_success = false; true};

        if (isNull objectParent _object) exitWith
        {
            DEBUG_FORMAT1_LOG("[TeleportPlayer] Target is a dismounted man: moving to location of %1.",_object)
            _unit setPosATL (getPosATL _object);
            _success = true;
            true
        };

        DEBUG_FORMAT1_LOG("[TeleportPlayer] Target is a mounted man: attempting to move into %1.",_vehicle)
        _ret = [_unit, _vehicle] call f_fnc_tryMoveIntoVehicle;

        if (_ret == 0) exitWith {_success = true; true};
        if (_ret == 2) exitWith {_success = false; true};

        if (time > _timeOut) exitWith {_success = false; true};

        sleep 1;
        false

    };


    if (!_success) then
    {
        DEBUG_PRINT_LOG("[TeleportPlayer] Failed to move to target: executing fallback code.")
        _this call _onFailure;
    }

};


_success = false;
_timeOut = time + 30;

waitUntil
{
    DEBUG_FORMAT1_LOG("[TeleportPlayer] Target is a vehicle: attempting to move into %1.",_object)
    _ret = [_unit, _object] call f_fnc_tryMoveIntoVehicle;

    if (_ret == 0) exitWith {_success = true; true};
    if (_ret == 2) exitWith {_success = false; true};

    if (time > _timeOut) exitWith {_success = false; true};

    sleep 1;
    false

};


if (!_success) then
{
    DEBUG_PRINT_LOG("[TeleportPlayer] Failed to move to target: executing fallback code.")
    _this call _onFailure;
}
