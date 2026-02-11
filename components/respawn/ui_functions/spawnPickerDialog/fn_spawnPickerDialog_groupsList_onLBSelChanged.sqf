#include "macros.hpp"
/*
    Populates the players list whenever the selected group changes
*/

disableSerialization;

params ["_control", "_lbCurSel"];


private _playersList = findDisplay IDD_SPAWNPICKER_DIALOG displayCtrl IDC_PLAYERSLIST;

private _selectedGroupName = _control lbData _lbCurSel;

DEBUG_FORMAT1_LOG("[RESPAWN] Updating players list for %1", _selectedGroupName);

private _sideGroups = groups playerSide;
private _selectedGroupIdx = _sideGroups findIf {(groupId _x) isEqualTo _selectedGroupName};

// Always clear the player list
lbClear _playersList;

// Add the players in the group, if the group actually exists
if (_selectedGroupIdx != -1) then {
    _units = units (_sideGroups # _selectedGroupIdx);
    {
        _playersList lbAdd (name _x);
    } forEach _units;
};