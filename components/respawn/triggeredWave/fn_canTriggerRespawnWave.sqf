#include "macros.hpp"

params ["_target"];

private _timestamp = [_target] call f_fnc_getRespawnTimestampForTarget;
private _sideRespawnDelay = [_target] call f_fnc_getSideRespawnDelayForTarget;

(CBA_missionTime >= (_timestamp + _sideRespawnDelay))