#include "macros.hpp"

disableSerialization;

// Populate players list
_this call f_fnc_groupsList_onLBSelChanged;

if (!(IS_TRUE(f_var_showSquadMarkers))) exitWith {};

params ["_groupsList", "_lbCurSel"];

// Move the map to the selected squad
private _selectedGroupName = _groupsList lbData _lbCurSel;

private _playerSide = side group player;
private _groups = allGroups select {(side _x) isEqualTo _playerSide};
private _selectedGroup = _groups param [_groups findIf {(groupId _x) isEqualTo _selectedGroupName}, grpNull];

if (SQUAD_VISIBLE(_selectedGroup) and (alive (leader _selectedGroup))) then {
    private _mapCtrl = (ctrlParent _groupsList) displayCtrl IDC_GROUPPICKER_MAP;
    _mapCtrl ctrlMapAnimAdd [0.5, 0.1, getPos (leader _selectedGroup)];
    ctrlMapAnimCommit(_mapCtrl);
};