#include "macros.hpp"

params ["_target", "_isFree"];

if !([_target] call f_fnc_canTriggerRespawnWave) exitWith { false };

_this call f_fnc_triggerRespawnWave;

true