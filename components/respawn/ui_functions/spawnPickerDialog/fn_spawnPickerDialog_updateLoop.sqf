#include "macros.hpp"
/*
    Update loop for the spawn picker dialog. Runs once per second while dialog is open.
    - Refreshes spawn list if a change is detected
    - Updates all of the info text at the top of the UI
*/

disableSerialization;

params ["_display"];

// Helper for determining if two locations are close enough to be considered the same
private _isSameLocation = {
    params ["_loc1", "_loc2"];
    private _return = true;

    // Compare each x, y, and z to make sure they are all within tolerance
    {   
        _otherX = _loc2 # _forEachIndex;
        if (abs (_x - _otherX) > 0.5) then {_return = false;};
    } forEach _loc1;

    _return
};

// Kill the loop if the dialog is closed
if (!(missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false])) exitWith {
    DEBUG_FORMAT1_LOG("[RESPAWN] Spawn picker dialog closed. Killing update loop.");
};

// Find the location of all of the respawns
private _spawns = (player call bis_fnc_getRespawnPositions) + ((player call bis_fnc_objectSide) call bis_fnc_getRespawnMarkers);
private _spawnListEntries = _spawns apply {[_x, (_x call BIS_fnc_showRespawnMenuPositionName) # 0]};
private _spawnLocations = [];
{
    switch (typeName _x) do {
        case "ARRAY": {_spawnLocations pushBack _x;};
        case "STRING": {_spawnLocations pushBack (getMarkerPos _x);};
        case "OBJECT": {_spawnLocations pushBack (getPosATL _x);};
    };
} forEach _spawns;

// Get the spawn locations found in the previous loop
private _oldSpawnLocations = missionNamespace getVariable ["f_arr_spawnPickerDialog_spawnLocations", []];
private _oldSpawnListEntries = missionNamespace getVariable ["f_arr_spawnPickerDialog_spawnListEntries", []];

private _spawnsChanged = false;

// Make sure there are the same number of spawns
if (count _spawnLocations != count _oldSpawnLocations) then {
    DEBUG_FORMAT2_LOG("[RESPAWN] Number of spawn locations changed (from %1 to %2). Updating spawn picker dialog.", count _oldSpawnLocations, count _spawnLocations);
    _spawnsChanged = true;
};

// Make sure the two lists have locations that match up
{
    if (!([_x, (_oldSpawnLocations # _forEachIndex)] call _isSameLocation)) then {
        _spawnsChanged = true; 
        DEBUG_FORMAT3_LOG("[RESPAWN] Detected movement of spawnpoint %1. Old loc %2, New loc %3", _oldSpawnListEntries # _forEachIndex, _oldSpawnLocations # _forEachIndex, _x);
        break;
    };
} forEach _spawnLocations;

// If the spawns changed, we completely remake the list
if (_spawnsChanged) then {

    // ---- First, clean up old markers and list

    // Delete all of the old respawn markers from the map
    private _spawnMarkers = missionNamespace getVariable ["f_arr_spawnPickerDialog_spawnMarkers", []];
    {
        deleteMarkerLocal _x;
    } forEach _spawnMarkers;
    _spawnMarkers = [];

    private _spawnList = _display displayCtrl IDC_SPAWNPICKER_SPAWNLIST;
    // Store the previously selected list index
    private _oldSelectedListIdx = lbCurSel _spawnList;
    // Clear the list of the old entries
    lbClear _spawnList;

    // Save the new spawn list entries
    missionNamespace setVariable ["f_arr_spawnPickerDialog_spawnListEntries", _spawnListEntries];
    // Grab the index (into _spawns) that was previously selected
    private _oldSelectedSpawnIdx = missionNamespace getVariable ["f_var_spawnPickerDialog_selectedSpawnIdx", -1];

    // ---- Then, recreate the list with the new spawns

    {
        _idx = _spawnList lbAdd (_x#1);
        _spawnList lbSetValue [_idx, _forEachIndex];
        _spawnMarkers set [_forEachIndex, "_respawnMarker" + str _forEachIndex];
    } forEach _spawnListEntries;

    _spawnList lbSortBy ["TEXT", false, false];

    private _selectedSpawn = missionNamespace getVariable ["f_var_spawnPickerDialog_selectedSpawn", objNull];
    private _selectedSpawnChanged = false;
    // Preferably, select the same spawn as was selected previously
    private _selectedSpawnIdx = (_spawnListEntries findIf {_x isEqualTo (_oldSpawnListEntries # _oldSelectedSpawnIdx)});
    private _selectedListIdx = -1;
    // If that spawn no longer exists, keep the selection at the same index or at the end of the list if it would be past that
    if (_selectedSpawnIdx == -1) then {
        _selectedListIdx = _oldSelectedListIdx min ((count _spawnListEntries) - 1);
        _selectedSpawnIdx = _spawnList lbValue _selectedListidx;
        _selectedSpawnChanged = true;
        DEBUG_FORMAT2_LOG("[RESPAWN] Could not find same spawn. Using selected list index %1, which is spawn index %2", _selectedListIdx, _selectedSpawnIdx);
    } else {
        // Get the list index that corresponds to the selected spawn index
        _selectedListIdx = [_selectedSpawnIdx, _spawnList] call f_fnc_spawnPickerDialog_getListIdxFromSpawnIdx;
    };
    
    missionNamespace setVariable ["f_arr_spawnPickerDialog_spawnMarkers", _spawnMarkers];
    missionNamespace setVariable ["f_arr_spawnPickerDialog_spawnLocations", _spawnLocations];

    // Mark all respawn points
    {
        createMarkerLocal [_x, _spawnLocations # _forEachIndex];
        _x setMarkerTypeLocal "respawn_inf"; // respawn_inf
    } forEach _spawnMarkers;

    // Embiggen the selected respawn point
    _spawnMarkers # _selectedSpawnIdx setMarkerSizeLocal [1.5, 1.5];

    // Center the map over the selected respawn point
    // Needs to be done here instead of just in onLBSelChanged event handler, presumably because the dialog is not done loading.
    if (_selectedSpawnChanged) then {
        DEBUG_PRINT_LOG("[RESPAWN] Scrolling map to new selected spawn");
        private _mapCtrl = _display displayCtrl IDC_RESPAWN_MAP;
        _mapCtrl ctrlMapAnimAdd [1, 0.4, _spawnLocations # (_selectedSpawnIdx max 0)];
        ctrlMapAnimCommit(_mapCtrl);
    };
    
    _spawnList lbSetCurSel (_selectedListIdx max 0);

    private _ignoreAlive = missionNamespace getVariable ["f_var_spawnPickerDialog_ignoreAlive", false];
    missionNamespace setVariable ["f_var_spawnPickerDialog_ignoreAlive", nil];
};

/*
    Info text section
*/
// Update the tickets remaining
[_display] call f_fnc_spawnPickerDialog_updateTickets;

[_display] call f_fnc_spawnPickerDialog_updateTimers;

[
    f_fnc_spawnPickerDialog_updateLoop,
    [_display],
    1
] call CBA_fnc_waitAndExecute;