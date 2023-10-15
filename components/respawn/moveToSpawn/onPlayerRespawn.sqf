#include "macros.hpp"

/*
	CAFE Move to Spawn on-respawn script.

	Make sure the player gets teleported when they spawn so they don't just appear on their old corpse.
    Need to teleport after player respawns - the BIS method doesn't defer execution so we have to do that.
*/

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// Players shouldn't be moved upon first spawn.
private _didFirstSpawn = missionNamespace getVariable ["f_var_squad_didFirstSpawn", false];
missionNamespace setVariable ["f_var_squad_didFirstSpawn", true];

if (_didFirstSpawn) exitWith 
{
    private _lastTpTime = missionNamespace getVariable ["f_var_spawnPickerDialog_lastTpTime", 0];
    if (_lastTpTime > (time - 1)) exitWith {};

    private _spawnArray = missionNamespace getVariable ["f_var_spawnPickerDialog_selectedSpawn", objNull];
    if (_spawnArray isEqualTo objNull) then 
    {
        // Choose an existing respawn point if one was not specified.
        private _spawns = (_newUnit call bis_fnc_getRespawnPositions) + ((_newUnit call bis_fnc_objectSide) call bis_fnc_getRespawnMarkers);

        if (count _spawns > 0) then
        {
            private _spawn = _spawns # 0;
            _spawnArray = [_spawn, (_spawn call BIS_fnc_showRespawnMenuPositionName) # 0];
        }
        else
        {
	        ["Unable to find a spawnpoint.  Ping Zeus for assistance."] call f_fnc_createSubtitleText;
        };        
    };
    
    if (_spawnArray isNotEqualTo objNull) then 
    {
        _spawnArray params ["_spawnPoint", ["_spawnName", "Unnamed"]];

        DEBUG_FORMAT3_CHAT("[MoveToSpawn]: Moving player %1 of side %2 to spawnpoint %3",_newUnit,(_newUnit call bis_fnc_objectSide),_spawnName)

        private _success = [_newUnit, _spawnPoint, true] call BIS_fnc_moveToRespawnPosition;
        missionNamespace setVariable ["f_var_spawnPickerDialog_lastTpTime", time];
    };
};