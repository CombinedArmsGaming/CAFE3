#include "macros.hpp"
/*
    Populates the players list whenever the selected group changes

    Arguments:
        0: String - Name of the newly selected group
        1: Control - Control of the players list

    Returns:
        Nothing
*/

disableSerialization;

params ["_selectedGroupName", "_playersList"];

DEBUG_FORMAT1_LOG("[UI] Updating players list for %1", _selectedGroupName);

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