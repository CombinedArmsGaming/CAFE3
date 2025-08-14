#include "macros.hpp"

disableSerialization;

params ["_control", "_lbCurSel"];
// systemChat format ["Selected index %1", _lbCurSel];

private _spawnList = _control;
private _oldSelectedSpawnIdx = missionNamespace getVariable ["f_var_spawnPickerDialog_selectedSpawnIdx", -1];
private _spawnMarkers = missionNamespace getVariable ["f_arr_spawnPickerDialog_spawnMarkers", []];
private _spawnLocations = missionNamespace getVariable ["f_arr_spawnPickerDialog_spawnLocations", []];
if (count _spawnLocations != count _spawnMarkers) then {
    systemChat format ["Uneven length of spawn locations and spawn markers. Locations length: %1, Markers length: %2", count _spawnLocations, count _spawnMarkers];
};

private _selectedListIdx = _lbCurSel;
private _selectedSpawnIdx = _spawnList lbValue _selectedListIdx;
private _spawns = missionNamespace getVariable ["f_arr_spawnPickerDialog_spawnListEntries", []];

if (count _spawns <= 0) exitWith 
{
    ["Unable to set your spawn location.  Please try again."] call f_fnc_createSubtitleText;
};

private _spawn = _spawns param [(_selectedSpawnIdx max 0), objNull];

// Deselect the old marker
if (_oldSelectedSpawnIdx > -1) then {
    if (_oldSelectedSpawnIdx < count _spawnMarkers) then {
        _spawnMarkers # _oldSelectedSpawnIdx setMarkerSizeLocal [1, 1];
    } else {
        systemChat format ["Attempted to deselect marker with index %1, but markers array only has length %2", _oldSelectedSpawnIdx, count _spawnMarkers];
    };
};

// Select the new marker
if (_selectedSpawnIdx < count _spawnMarkers) then {
    _spawnMarkers # _selectedSpawnIdx setMarkerSizeLocal [1.5, 1.5];
};

private _mapCtrl = findDisplay IDD_SPAWNPICKER_DIALOG displayCtrl IDC_RESPAWN_MAP;
_mapCtrl ctrlMapAnimAdd [0.5, 0.4, _spawnLocations # _selectedSpawnIdx];
ctrlMapAnimCommit(_mapCtrl);

// if ((_spawn isEqualType objNull) and {!alive _spawn}) then
// {
//     _spawn = _spawns # 0;
//     [format ["Your chosen spawn location is unavailable.  '%1' has been selected.", (_spawn # 1)]] call f_fnc_createSubtitleText;
// };

missionNamespace setVariable ["f_var_spawnPickerDialog_selectedSpawnIdx", (_selectedSpawnIdx max 0)];
systemChat format ["Selected index %1, spawn Index %2, set selected spawn to %3", _selectedListIdx, _selectedSpawnIdx, _spawn];