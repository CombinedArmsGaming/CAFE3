#include "macros.hpp"

disableSerialization;

params ["_display"];

// Group name editor.
private _spawns = (player call bis_fnc_getRespawnPositions) + ((player call bis_fnc_objectSide) call bis_fnc_getRespawnMarkers);
private _spawnListEntries = _spawns apply {[_x, (_x call BIS_fnc_showRespawnMenuPositionName) # 0]};

missionNamespace setVariable ["f_arr_spawnPickerDialog_spawnListEntries", _spawnListEntries];

private _spawnList = _display displayCtrl IDC_SPAWNPICKER_SPAWNLIST;

{
    _idx = _spawnList lbAdd (_x#1);
    _spawnList lbSetValue [_idx, _forEachIndex];

} forEach _spawnListEntries;

_spawnList lbSortBy ["TEXT", false, false];

private _selectedSpawn = missionNamespace getVariable ["f_arr_spawnPickerDialog_selectedSpawn", objNull];
private _selectedSpawnIdx = _spawns findIf {_x isEqualTo _selectedSpawn};

_spawnList lbSetCurSel (_selectedSpawnIdx max 0);

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