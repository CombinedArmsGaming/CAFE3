#include "macros.hpp"

// Add a set of respawn pollers to the respawn manager.  The given spawn parameters will be used according to the poller conditions.
// If the given spawn parameters are already being managed, the pollers will be replaced with the new ones.

SERVER_ONLY;

params ["_spawnParams", "_pollerArray"];
_spawnParams params ["_target", "_location", "_name"];

private _key = [_location, _target] call f_fnc_getRespawnKey;
private _respawnEntry = f_var_respawnPollersMap get _key;

if !(isNil "_respawnEntry") exitWith
{	
	DEBUG_FORMAT1_LOG("[RESPAWN] Respawn key %1 already exists - replacing poll array.",_key)
	_respawnEntry set [2, _pollerArray];
};

// [bool exists, array respawnInfo]
private _state = [false, []];
_respawnEntry = [_key, _spawnParams, _pollerArray, _state];

DEBUG_FORMAT1_LOG("[RESPAWN] Adding new managed respawn %1.",_key)
f_var_respawnPollersMap set [_key, _respawnEntry];