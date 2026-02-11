#include "macros.hpp"
/*
    Populate the spawn picker dialog when it is initially opened
*/

disableSerialization;

params ["_display"];

/*
    ==== Spawns List ====
*/
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

/*
    ==== Map Control ====
*/
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
    _x setMarkerTypeLocal "respawn_inf";
} forEach _spawnMarkers;

// Center the map over the selected respawn point
// Needs to be done here instead of just in onLBLSelChanged event handler, presumably because the dialog is not done loading.
private _mapCtrl = _display displayCtrl IDC_RESPAWN_MAP;
_mapCtrl ctrlMapAnimAdd [0, 0.4, _spawnLocations # _selectedSpawnIdx];
ctrlMapAnimCommit(_mapCtrl);

[_display, _mapCtrl] call f_fnc_createFireteamMarkerHook;
[_display, _mapCtrl] call f_fnc_createSquadMarkerHook;

/*
    ==== Groups List ====
    List all important squads on the player's side. 
    The squads might not exist at the moment of population, so use their stored names instead of looking for them
    It can be assumed that the squads will exist again later thanks to components/squadMarkers/fn_maintainImportantSquad.sqf
*/
// List of important squads as [groupId group, side group]. Created in startup/configuration/internals/squadMarkers.sqf
private _groupsList = _display displayCtrl IDC_GROUPSLIST;

// Collect all important squads and all squads with players in them that it makes sense to let this player join
private _groupsToInclude = (groups playerSide) select {
	private _name = groupId _x;

	// Not spectators group
	(_name isNotEqualTo "Spectators") and
	// Not zeus group if the player is not a zeus
	((player getVariable ["f_var_isZeus", false]) or {(toLower _name) isNotEqualTo "zeus"}) and 
	// Must either be important or have players in
	(SQUAD_IS_IMPORTANT(_x) or ({((units _x) findIf { isPlayer _x }) >= 0}))
};

// Add the squads to the list
{
	private _name = groupId _x;
	private _count = count (units _x);
	private _idx = _groupsList lbAdd (format ["%1 (%2)", _name, _count]);
	_groupsList lbSetData [_idx, _name];
} forEach _groupsToInclude;

_groupsList lbSortBy ["TEXT", false, false];

// Default select the item in the list according to the players last group name
private _playerGroupName = missionNamespace getVariable ["f_var_lastPlayerGroupName", ""];
DEBUG_FORMAT1_LOG("[RESPAWN] lastPlayerGroupName was %1, attempting to select", _playerGroupname);
for "_i" from 0 to ((lbSize _groupsList) - 1) do {
    if ((_groupsList lbData _i) isEqualTo _playerGroupName) exitWith {
        _groupsList lbSetCurSel _i;
    }
};

/*
    Teleport Checkbox
*/
// Disable the checkbox if teleport on respawn is not allowed
#ifndef ALLOW_TELEPORT_UPON_RESPAWN
private _teleportCheckbox = _display displayCtrl IDC_TELEPORTCHECKBOX;
_teleportCheckbox ctrlSetChecked false;
_teleportCheckbox ctrlEnable false;
_teleportCheckbox lbSetText [0, "Disabled"];
_teleportCheckbox ctrlSetBackgroundColor [0.2,0.2,0.2,0.5];
_teleportCheckbox ctrlCommit 0;
#endif

/*
    Info Text
*/
private _ticketsText = _display displayCtrl IDC_TICKETS_TEXT;
_ticketsText ctrlShow ([RESPAWN_TICKETS] call f_fnc_isRespawnModeActive);
private _waveInfo = _display displayCtrl IDC_WAVE_TEXT;
_waveInfo ctrlShow ([RESPAWN_TRIGGERED_WAVE] call f_fnc_isRespawnModeActive);

/*
    Misc
*/
[_display] call f_fnc_spawnPickerDialog_updateTickets;

_spawnList lbSetCurSel (_selectedListIdx max 0);
DEBUG_FORMAT3_LOG("[RESPAWN] Selecting list index %1, spawn index %2, spawn %3", _selectedListIdx, _selectedSpawnIdx, _spawnListEntries # _selectedSpawnIdx);

["location"] call f_fnc_spawnPickerDialog_switchInfoBox;

private _ignoreAlive = missionNamespace getVariable ["f_var_spawnPickerDialog_ignoreAlive", false];
missionNamespace setVariable ["f_var_spawnPickerDialog_ignoreAlive", nil];


// Ensure dialog is closed when player spawns.
[
    {
        ((!_ignoreAlive) and (alive player)) or (!(missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false]))
    },
    {
        if (missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false]) then
        {
            closeDialog 2;
        };
    },
    []
] call CBA_fnc_waitUntilAndExecute;

missionNamespace setVariable ["f_var_spawnPickerDialog_respawnHeld", false];
missionNamespace setVariable ["f_var_spawnPickerDialog_isOpened", true];

[_display] call f_fnc_spawnPickerDialog_updateLoop;
[] call f_fnc_spawnPickerDialog_delaySpawnUntilReady;