// CA respawn system with wave respawns

#include "macros.hpp"

params ["_unit", "_corpse"];

DEBUG_PRINT_LOG("[RespawnWaves] Player respawning...")

CLIENT_ONLY;
LOCAL_ONLY(_unit);

#include "..\parts\tryTeleport.sqf"
#include "..\parts\applyOldLoadout.sqf"




_tryJoinSquad =
{
    params ["_unit", "_groupId"];

    _beginTime = time;

    while {(time < _beginTime + 20) and {!((groupId (group _unit)) isEqualTo _groupId)}} do
    {
        _side = side _unit;
        _group = GET_SQUAD_ON_SIDE_DYNAMIC(_groupId,_side);
        DEBUG_FORMAT3_CHAT("Finding group with id %1 for side %2: %3",_groupId,(str _side),(str _group));

        if EXISTS(_group) then
        {
            [_unit] joinSilent _group;
        };

        sleep 1;

    };

    if !((groupId (group _unit)) isEqualTo _groupId) then
    {
        _text = format ["Unable to auto-join squad '%1'.\n\nYou will need to re-join or re-create the squad using 'CA Squad Actions'.", _groupId];
        cutText [_text, "PLAIN DOWN", 1, true, false];

    };

};




_doRespawn =
{
    params ["_unit", "_corpse", "_isJip"];

    if ((_isJip and IS_TRUE(f_var_JIPTeleport)) or ((!_isJip) and IS_TRUE(f_var_RespawnTeleport))) then
    {
        player setVariable ["f_var_mayTeleportToGroup", true, true];
    };

    #include "..\parts\zeusAdditions_onRespawn.sqf"

    [_unit, true] call f_fnc_activatePlayer;
    f_var_playerHasBeenKilled = false;

};




if (time < 30) exitWith
{
    DEBUG_PRINT_LOG("[RespawnWaves] Time < 30, skipping respawn wave...")
    [_unit, _corpse, false] call _doRespawn;
}; // Apply a grace period at mission start.




// MAKE SURE THE PLAYER INITIALIZES PROPERLY
WAIT_UNTIL_PLAYER_EXISTS();

_hasBeenKilled = missionNamespace getVariable ["f_var_playerHasBeenKilled", false];

DEBUG_FORMAT1_LOG("[RespawnWaves] Player has been killed?: %1",_hasBeenKilled)




// Join in progress and instant respawn handling
if (!_hasBeenKilled) exitWith
{
    DEBUG_PRINT_LOG("[RespawnWaves] Player was not killed, handling as JIP...")
    [_unit, _corpse, true] call _doRespawn;

};




if (_hasBeenKilled) then
{
    DEBUG_PRINT_LOG("[RespawnWaves] Player was killed, adding to respawn wave...")

    [_unit, false] call f_fnc_activatePlayer;

    [_unit, "Spectators"] spawn _tryJoinSquad;
    DEBUG_PRINT_LOG("[RespawnWaves] Joining player to spectator group.")

    [_unit, _corpse] spawn _applyOldLoadout;

    // Wait for respawn to happen
    _waveInfo = false;
    _side = side _unit;

    waitUntil
    {
        sleep 0.5;

        _waveInfo = GET_RESPAWN_WAVE(_side);

        if (_waveInfo isEqualTo []) exitWith {false};
        if (((count _waveInfo) > 0) and {(_waveInfo select 0) isEqualTo true}) exitWith { true };

		false

    };

    DEBUG_PRINT_LOG("[RespawnWaves] Respawn wave enabled, teleporting...")

    // Try spawning at designated location, or fallback to base location.
    _spawnAt = _waveInfo param [1, []];
    _joinGroup = _waveInfo param [2, ""];

    switch (_joinGroup) do
    {
        case (ORIGINAL_SQUAD):
        {
            _originalGroupId = missionNamespace getVariable ["f_var_playerOriginalGroupName", ""];

            if (_originalGroupId isEqualTo "") then
            {
                DEBUG_PRINT_LOG("[RespawnWaves] Respawn group was ORIGINAL_SQUAD, but player does not have an original squad.  Joining player to empty group.")
                [_unit] joinSilent grpNull;
            };

            DEBUG_FORMAT1_LOG("[RespawnWaves] Attempting to join player to original group: %1",_originalGroupId)
            [_unit, _originalGroupId] spawn _tryJoinSquad;

            f_var_respawnTitle_squadMode = "OriginalSquad";
            f_var_respawnTitle_targetSquad = _originalGroupId;
            "CA2_RespawnTitle" cutRsc ["CA2_RespawnTitle", "PLAIN", -1, false];

        };

        case (""):
        {
            DEBUG_PRINT_LOG("[RespawnWaves] Respawn group was absent, joining player to empty group.")
            [_unit] joinSilent grpNull;

            f_var_respawnTitle_squadMode = "Error";
            f_var_respawnTitle_targetSquad = "";
            "CA2_RespawnTitle" cutRsc ["CA2_RespawnTitle", "PLAIN", -1, false];

        };

        default
        {
            DEBUG_FORMAT1_LOG("[RespawnWaves] Attempting to join player to respawn group: %1",_joinGroup)
            [_unit, _joinGroup] spawn _tryJoinSquad;

            f_var_respawnTitle_squadMode = "RespawnSquad";
            f_var_respawnTitle_targetSquad = _joinGroup;
            "CA2_RespawnTitle" cutRsc ["CA2_RespawnTitle", "PLAIN", -1, false];

        };

    };


    if ((_spawnAt isEqualTo []) or {(typeName _spawnAt isEqualTo typeName objNull) and {isNull _spawnAt}}) then
    {
        DEBUG_PRINT_LOG("[RespawnWaves] Respawn wave did not include a position or entity, using respawn marker pos.")
        _spawnAt = RESPAWN_MARKER_POS(_side);
    };

    _tpHandle = [_spawnAt] spawn _tryTeleport;

    waitUntil { scriptDone _tpHandle };

    [_unit, _corpse, true] call _doRespawn;

    DEBUG_PRINT_LOG("[RespawnWaves] All done.")

}
