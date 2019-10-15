// CA respawn system with wave respawns

#include "macros.hpp"

params ["_unit", "_corpse"];

DEBUG_PRINT_LOG("[RespawnWaves] Player respawning...")

CLIENT_ONLY;
LOCAL_ONLY(_unit);

#include "..\parts\tryTeleport.sqf"
#include "..\parts\handleJipMenu.sqf"
#include "..\parts\applyOldLoadout.sqf"

_doRespawn =
{
    params ["_unit", "_corpse", "_doJipMenu"];
    [_unit, _corpse] spawn _applyOldLoadout;
    [false] call ace_spectator_fnc_setSpectator;
    if (_doJipMenu) then { [] spawn _handleJipMenu };

    #include "..\parts\zeusAdditions_onRespawn.sqf"

};


if (time < 30) exitWith
{
    DEBUG_PRINT_LOG("[RespawnWaves] Time < 30, skipping respawn wave...")
    [_unit, _corpse, false] call _doRespawn;
}; // Apply a grace period at mission start.


// MAKE SURE THE PLAYER INITIALIZES PROPERLY
WAIT_UNTIL_PLAYER_EXISTS();


_hasBeenKilled = missionNamespace getVariable ["f_var_playerHasBeenKilled", false];
f_var_playerHasBeenKilled = false;

DEBUG_FORMAT1_LOG("[RespawnWaves] Player has been killed?: %1",_hasBeenKilled)


// Join in progress and instant respawn handling
if (!_hasBeenKilled) exitWith
{
    DEBUG_PRINT_LOG("[RespawnWaves] Player was not killed, handling as JIP...")
    [_unit, _corpse, f_var_JIP_JIPMenu] call _doRespawn;

};
// if () exitWith {} else {} doesn't exist in SQF...
if (_hasBeenKilled) then
{
    DEBUG_PRINT_LOG("[RespawnWaves] Player was killed, adding to respawn wave...")

    [_unit, false] call f_fnc_activatePlayer;

    if (!f_var_respawnInGroup) then
    {
        [_unit] join grpNull;
    };

    [_unit, _corpse] spawn _applyOldLoadout;

    // Wait for respawn to happen
    _waveInfo = false;

    waitUntil
    {
        sleep 0.5;

        _waveInfo = ca_respawnwave;
        if (_waveInfo isEqualTo false) exitWith {false};
        if ((typeName _waveInfo == typeName []) and {(_waveInfo select 0) isEqualTo true}) exitWith { true };

		false

    };

    DEBUG_PRINT_LOG("[RespawnWaves] Respawn wave enabled, teleporting...")

    // Try spawning at designated location, or fallback to base location.
    _spawnAt = _waveInfo select 1;
    _tpHandle = [_spawnAt] spawn _tryTeleport;

    waitUntil { scriptDone _tpHandle };
    [_unit, true] call f_fnc_activatePlayer;
    [false] call ace_spectator_fnc_setSpectator;

    if (f_var_JIP_RespawnMenu) then
    {
        [] spawn _handleJipMenu;
    };

    #include "..\parts\zeusAdditions_onRespawn.sqf"

    // [_unit] call f_fnc_paradropUnit;

    DEBUG_PRINT_LOG("[RespawnWaves] All done.")

}
