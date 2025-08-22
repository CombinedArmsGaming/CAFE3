#include "macros.hpp"
/*
    Switches the info box being displayed to one of "location", "group", or "loadout" based on second param
*/

disableSerialization;

params [["_newInfoBox", ""]];

private _display = findDisplay IDD_SPAWNPICKER_DIALOG;

private _locationList = _display displayCtrl IDC_SPAWNPICKER_SPAWNLIST;
private _locationMap = _display displayCtrl IDC_RESPAWN_MAP;

private _groupGroup = _display displayCtrl IDC_GROUP_CT_GROUP;
private _groupsList = _display displayCtrl IDC_GROUPSLIST;

private _loadoutGroup = _display displayCtrl IDC_LOADOUT_CT_GROUP;
private _loadoutsList = _display displayCtrl IDC_LOADOUTSLIST;

private _locationButton = _display displayCtrl IDC_LOCATION_BUTTON;
private _groupButton = _display displayCtrl IDC_GROUP_BUTTON;
private _loadoutButton = _display displayCtrl IDC_LOADOUT_BUTTON;

private _selectedColor = [PRIMARY_COLOR];

switch (_newInfoBox) do {
    case "location": {
        _groupGroup ctrlShow false;
        _loadoutGroup ctrlShow false;
        _locationList ctrlShow true;
        _locationMap ctrlShow true;

        _locationButton ctrlSetBackgroundColor [LOCATION_PICKER_COLOR];
        _groupButton ctrlSetBackgroundColor [BLACK];
        _loadoutButton ctrlSetBackgroundColor [BLACK];

        // Set focus on the list to stop the button from flashing
        ctrlSetFocus _locationList;

        _selectedColor = [LOCATION_PICKER_COLOR];

        DEBUG_PRINT_LOG("[RESPAWN] Switching info boxes to location");
    };
    case "group": {
        _groupGroup ctrlShow true;
        _loadoutGroup ctrlShow false;
        _locationList ctrlShow false;
        _locationMap ctrlShow false;

        _locationButton ctrlSetBackgroundColor [BLACK];
        _groupButton ctrlSetBackgroundColor [GROUP_PICKER_COLOR];
        _loadoutButton ctrlSetBackgroundColor [BLACK];

        ctrlSetFocus _groupGroup;

        _selectedColor = [GROUP_PICKER_COLOR];

        // Ensure that the players list is updated for the current selection
        [_groupsList, lbCurSel _groupsList] call f_fnc_spawnPickerDialog_groupsList_onLBSelChanged;

        DEBUG_PRINT_LOG("[RESPAWN] Switching info boxes to group");
    };
    case "loadout": {
        _groupGroup ctrlShow false;
        _loadoutGroup ctrlShow true;
        _locationList ctrlShow false;
        _locationMap ctrlShow false;

        _locationButton ctrlSetBackgroundColor [BLACK];
        _groupButton ctrlSetBackgroundColor [BLACK];
        _loadoutButton ctrlSetBackgroundColor [LOADOUT_PICKER_COLOR];

        ctrlSetFocus _loadoutGroup;

        _selectedColor = [LOADOUT_PICKER_COLOR];

        [_loadoutsList, lbCurSel _loadoutsList] call f_fnc_spawnPickerDialog_loadoutsList_onLBSelChanged;

        DEBUG_PRINT_LOG("[RESPAWN] Switching info boxes to loadout");
    };
    default {
        DEBUG_FORMAT1_LOG("[RESPAWN] spawnPickerDialog_switchInfoBox called with invalid string %1", _newInfoBox);
    }
};

// Update the color of the outline
for "_i" from 0 to 3 do {
    private _border = _display displayCtrl (IDC_INFO_BOX_OUTLINE + _i);

    _border ctrlSetBackgroundColor _selectedColor;
};