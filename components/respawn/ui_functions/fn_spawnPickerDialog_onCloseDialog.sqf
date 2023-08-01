#include "macros.hpp"

disableSerialization;

params ["_display", "_exitCode"];


if (_exitCode == 2) exitWith {};


if (_exitCode == 1) then
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

    if ((typeName _spawn isEqualTo "OBJECT") and {!alive _spawn}) then
    {
        _spawn = _spawns # 0;
	    [format ["Your chosen spawn location is unavailable.  '%1' has been selected.", (_spawn # 1)]] call f_fnc_createSubtitleText;
    };

    missionNamespace setVariable ["f_var_spawnPickerDialog_selectedSpawn", _spawn];

    // Need to teleport after player respawns - the BIS method doesn't defer execution so we have to do that.
    [
        {
            alive player
        },
        {
            private _lastTpTime = missionNamespace getVariable ["f_var_spawnPickerDialog_lastTpTime", 0];
            if (_lastTpTime > (time - 1)) exitWith {};

            private _spawn = missionNamespace getVariable ["f_var_spawnPickerDialog_selectedSpawn", objNull];
            if (_spawn isEqualTo objNull) exitWith 
            {
	            ["Unable to spawn at your chosen location.  Teleport to a squad or ping Zeus."] call f_fnc_createSubtitleText;
            };

            private _success = [player, _spawn # 0, true] call BIS_fnc_moveToRespawnPosition;
            missionNamespace setVariable ["f_var_spawnPickerDialog_lastTpTime", time];
        },
        []
    
    ] call CBA_fnc_waitUntilAndExecute;
};
