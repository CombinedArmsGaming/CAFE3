#include "macros.hpp"

// Forces a managed respawn to be removed and all polling to be stopped for that respawn.

params ["_location", "_target"];

private _key = [_location, _target] call f_fnc_getRespawnKey;

DEBUG_FORMAT1_LOG("[RESPAWN] Forcing removal of managed respawn %1.",_key)

private _respawnEntry = f_var_respawnPollersMap getOrDefault [_key, ["",[]]];
(_respawnEntry#1) set [0, objNull];