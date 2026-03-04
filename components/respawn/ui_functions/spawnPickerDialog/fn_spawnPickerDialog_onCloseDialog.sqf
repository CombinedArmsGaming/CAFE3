#include "macros.hpp"

disableSerialization;

params ["_display", "_exitCode"];


missionNamespace setVariable ["f_var_spawnPickerDialog_isOpened", false];
missionNamespace setVariable ["f_var_spawnPickerDialog_selectedSpawnIdx", -1];

// Delete all of the respawn markers from the map
private _spawnMarkers = missionNamespace getVariable ["f_arr_spawnPickerDialog_spawnMarkers", []];
{
    deleteMarkerLocal _x;
} forEach _spawnMarkers;
missionNamespace setVariable ["f_arr_spawnPickerDialog_spawnMarkers", []];

if (missionNamespace getVariable ["f_var_spawnPickerDialog_respawnHeld", false]) then {
    DEBUG_PRINT_LOG("[RESPAWN] Dialog closed after respawn held. Respawning player.");
    setPlayerRespawnTime 1;
    missionNamespace setVariable ["f_var_spawnPickerDialog_respawnHeld", false];
};

// Discard changes if closing dialog with cancel button
if (_exitCode == 3) exitWith {

};

// Save changes whether exiting with ready button or escape
if (_exitCode == 1 or _exitCode == 2) then
{
    private _spawnList = _display displayCtrl IDC_SPAWNPICKER_SPAWNLIST;

    private _selectedIdx = lbCurSel _spawnList;
    private _selectedSpawnIdx = _spawnList lbValue _selectedIdx;
    private _spawns = missionNamespace getVariable ["f_arr_spawnPickerDialog_spawnListEntries", []];

    if (count _spawns <= 0) exitWith 
    {
	    ["Unable to set your spawn location.  Please try again."] call f_fnc_createSubtitleText;
    };

    private _spawn = _spawns param [(_selectedSpawnIdx max 0), objNull];

    if ((_spawn isEqualType objNull) and {!alive _spawn}) then
    {
        _spawn = _spawns # 0;
	    [format ["Your chosen spawn location is unavailable.  '%1' has been selected.", (_spawn # 1)]] call f_fnc_createSubtitleText;
    };

    missionNamespace setVariable ["f_var_spawnPickerDialog_selectedSpawn", _spawn];

    // Store the player's selection of group

    private _groupsList = _display displayCtrl IDC_GROUPSLIST;
    DEBUG_FORMAT1_LOG("[RESPAWN] Dialog closing, groups list selected index was %1", _groupsList lbData (lbCurSel _groupsList));
    if ((lbCurSel _groupsList) >= 0) then {
        private _groupName = _groupsList lbData (lbCurSel _groupsList);
        DEBUG_FORMAT1_LOG("[RESPAWN] Storing new group for player: %1", _groupName);
        missionNamespace setVariable ["f_var_lastPlayerGroupName", _groupName];
    };

    #ifdef ALLOW_LOADOUT_CHANGE_UPON_RESPAWN
    // Store the player's selection of loadout
    private _loadoutsList = _display displayCtrl IDC_LOADOUTSLIST;
    if ((lbCurSel _loadoutsList) >= 0) then {
        private _loadoutName = _loadoutsList lbData (lbCurSel _loadoutsList);
        player setVariable ["f_var_assignGear", _loadoutName];
        DEBUG_FORMAT1_LOG("[RESPAWN] Storing new chosen loadout %1", _loadoutName);
    };
    #endif

    #ifdef ALLOW_TELEPORT_UPON_RESPAWN
    // Store whether the player wishes to be teleported on spawn
    private _teleportCheckbox = _display displayCtrl IDC_TELEPORTCHECKBOX;
    _isChecked = _teleportCheckbox ctrlChecked 0;
    missionNamespace setVariable ["f_var_playerWishesTeleportAfterRespawn", _isChecked];
    DEBUG_FORMAT1_LOG("[RESPAWN] Player wishes to teleport set to %1", _isChecked);
    #else 
    missionNamespace setVariable ["f_var_playerWishesTeleportAfterRespawn", false];
    #endif
};
