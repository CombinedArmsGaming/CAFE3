#include "macros.hpp"

disableSerialization;

params ["_display"];

// Group name editor.
private _spawns = (player call bis_fnc_getRespawnPositions) + ((player call bis_fnc_objectSide) call bis_fnc_getRespawnMarkers);
private _spawnListEntries = _spawns apply {[_x, (_x call BIS_fnc_showRespawnMenuPositionName) # 0]};
// Markers have the name "_respawnMarker<index>"
private _spawnMarkers = [];

missionNamespace setVariable ["f_arr_spawnPickerDialog_spawnListEntries", _spawnListEntries];

private _spawnList = _display displayCtrl IDC_SPAWNPICKER_SPAWNLIST;

{
    _idx = _spawnList lbAdd (_x#1);
    _spawnList lbSetValue [_idx, _forEachIndex];
    _spawnMarkers set [_forEachIndex, "_respawnMarker" + str _forEachIndex];
} forEach _spawnListEntries;

_spawnList lbSortBy ["TEXT", false, false];

private _selectedSpawn = missionNamespace getVariable ["f_var_spawnPickerDialog_selectedSpawn", objNull];
private _selectedSpawnIdx = (_spawnListEntries findIf {_x isEqualTo _selectedSpawn});
private _selectedListIdx = -1;
// If there wasn't a previously selected spawn, just select the first spawn in the list
if (_selectedSpawnIdx == -1) then {
    DEBUG_FORMAT2_LOG("[RESPAWN] Could not find previously selected spawn %1, spawns were %2", _selectedSpawn, _spawns);
    _selectedListIdx = 0;
    _selectedSpawnIdx = _spawnList lbValue 0;
} else {
    DEBUG_FORMAT1_LOG("[RESPAWN] Using previously selected spawn %1", _selectedSpawn);
    _selectedListIdx = [_selectedSpawnIdx, _spawnList] call f_fnc_spawnPickerDialog_getListIdxFromSpawnIdx;
};

// =======================
//      Map Control

// Get locations of respawn points
// getRespawnPositions can return Array (PositionATL), Object (specific object), or String (marker name)
private _spawnLocations = [];
{
    switch (typeName _x) do {
        case "ARRAY": {_spawnLocations pushBack _x;};
        case "STRING": {_spawnLocations pushBack (getMarkerPos _x);};
        case "OBJECT": {_spawnLocations pushBack (getPosATL _x);};
    };
} forEach _spawns;
missionNamespace setVariable ["f_arr_spawnPickerDialog_spawnMarkers", _spawnMarkers];
missionNamespace setVariable ["f_arr_spawnPickerDialog_spawnLocations", _spawnLocations];

// Mark all respawn points
{
    createMarkerLocal [_x, _spawnLocations # _forEachIndex];
    _x setMarkerTypeLocal "flag_Denmark"; // respawn_inf
} forEach _spawnMarkers;

// Center the map over the selected respawn point
// Needs to be done here instead of just in onLBLSelChanged event handler, presumably because the dialog is not done loading.
private _mapCtrl = _display displayCtrl IDC_RESPAWN_MAP;
_mapCtrl ctrlMapAnimAdd [0, 0.4, _spawnLocations # _selectedSpawnIdx];
ctrlMapAnimCommit(_mapCtrl);

// =======================

_spawnList lbSetCurSel (_selectedListIdx max 0);
DEBUG_FORMAT3_LOG("[RESPAWN] Selecting list index %1, spawn index %2, spawn %3", _selectedListIdx, _selectedSpawnIdx, _spawnListEntries # _selectedSpawnIdx);

private _ignoreAlive = missionNamespace getVariable ["f_var_spawnPickerDialog_ignoreAlive", false];
missionNamespace setVariable ["f_var_spawnPickerDialog_ignoreAlive", nil];


// Ensure dialog is closed when player spawns.
[
    {
        ((!_ignoreAlive) and {alive player}) or {!(missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false])}
    },
    {
        if (missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false]) then
        {
            closeDialog 2;
        };
    },
    []
] call CBA_fnc_waitUntilAndExecute;

missionNamespace setVariable ["f_var_spawnPickerDialog_isOpened", true];

[_display] call f_fnc_spawnPickerDialog_updateLoop;