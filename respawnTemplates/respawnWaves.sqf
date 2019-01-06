// CA respawn system with wave respawns

#include "..\macros.hpp"
CLIENT_ONLY;


_tryTeleport =
{
    params ["_goto"];

    _onTeleportFailure =
    {
        DEBUG_FORMAT1_LOG("[RespawnWaves] Failed to teleport to location, defaulting to location of %1.",ca_respawnmarker)
        _basePos = getMarkerPos ca_respawnmarker;
        [player, _basePos] spawn f_fnc_teleportPlayer;
    };

    DEBUG_FORMAT1_LOG("[RespawnWaves] Attempting to teleport to %1.",_goto)
    _teleHandle = [player, _goto, _onTeleportFailure] spawn f_fnc_teleportPlayer;

    waitUntil { sleep 0.1; scriptDone _teleHandle };

};


_handleJipMenu =
{
    if (!f_var_JIP_JIPMenu) exitWith {}; //do JIP players get teleport menu?

    sleep 5;

    if (isNil "F3_JIP_reinforcementOptionsAction") then
    {
    	[player] spawn f_fnc_addJipReinforcementOptionsAction;
    };

};


// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (isNull player) then
{
    waitUntil
    {
        sleep 0.1;
        !(isNull player or {isNil "f_var_initServer"})
    };

};


params ["_unit","_corpse"];

if (!f_var_JIP_JIPMenu && isNull _corpse) exitWith {}; // If no corpse exists the player is spawned for the first time.

if (time < 10 && isNull _corpse) exitWith {}; //if not a JIP and its the start of the mission exit out


RUN_FUNC_ONCE_ASYNC(f_fnc_aceRespawnMenuAction)


// Join in progress and instant respawn handling
if ((time < 10) || (isNull _corpse)) exitWith
{
    _loadout = (_unit getVariable "f_var_assignGear");
    _unit setVariable ["f_var_assignGear_done", false, true];

    [_loadout, player] spawn f_fnc_assignGear;

    [] spawn _handleJipMenu;

};


if (!f_var_respawnInGroup) then
{
    [player] join grpNull;
};


// Enter spectator
[true] call ace_spectator_fnc_setSpectator;
[] call f_fnc_removeRadios;  //Remove any additional radios for sure


// Wait for respawn to happen
_waveInfo = false;

waitUntil
{
    sleep 0.5;

    _waveInfo = ca_respawnwave;
    if (_waveInfo isEqualTo false) exitWith {};
    if ((typeName _waveInfo == typeName []) and {(_waveInfo select 0) isEqualTo true}) exitWith { true };

};

// F3 assign radio and gear
_loadout = (_unit getVariable "f_var_assignGear");
_unit setVariable ["f_var_assignGear_done", false, true];

[_loadout, player] spawn f_fnc_assignGear;

// Try spawning at designated location, or fallback to base location.
_spawnAt = _waveInfo select 1;
_tpHandle = [_spawnAt] spawn _tryTeleport;

waitUntil { scriptDone _tpHandle };
[false] call ace_spectator_fnc_setSpectator;

[] spawn _handleJipMenu;

// [_unit] call f_fnc_paradropUnit;
