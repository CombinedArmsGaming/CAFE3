#include "macros.hpp"
#include "\a3\ui_f\hpp\definecommongrids.inc"

disableSerialization;

params ["_display"];

// Current group name
private _group = group player;

private _groupText = _display displayCtrl IDC_GROUPPICKER_CURRENTSQUADTEXT;
_groupText ctrlSetText (format ["You are in:\n%1", groupId _group]);

private _groupList = _display displayCtrl IDC_GROUPSLIST;
[_grouplist] call f_fnc_populateGroupsList;

// Set focus to stop the ready button from flashing
ctrlSetFocus _groupList;

/* Map */
private _mapCtrl = _display displayCtrl IDC_GROUPPICKER_MAP;

if (IS_TRUE(f_var_showSquadMarkers)) then {
    _mapCtrl ctrlShow true;

    [_display, _mapCtrl] call f_fnc_createFireteamMarkerHook;
    [_display, _mapCtrl] call f_fnc_createSquadMarkerHook;
    
    // Shorten all the lists to make room for the map
    private _verticalBarrier = _display displayCtrl IDC_GROUPPICKER_VERTICALBARRIER;
    _verticalBarrier ctrlSetPositionH (groupInfoBoxHeight * GRID_H);
    _verticalBarrier ctrlCommit 0;

    private _leftBorder = _display displayCtrl IDC_GROUPPICKER_LEFTBORDER;
    private _bottomBorder = _display displayCtrl IDC_GROUPPICKER_BOTTOMBORDER;
    private _rightBorder = _display displayCtrl IDC_GROUPPICKER_RIGHTBORDER;

    _leftBorder ctrlSetPositionH ((infoBoxOutlineWidth * 2 + groupInfoBoxHeight) * GRID_H);
    _leftBorder ctrlCommit 0;

    _bottomBorder ctrlSetPositionY ((infoBoxOutlineWidth + groupInfoBoxHeight) * GRID_H);
    _bottomBorder ctrlCommit 0;

    _rightBorder ctrlSetPositionH ((infoBoxOutlineWidth * 2 + groupInfoBoxHeight) * GRID_H);
    _rightBorder ctrlCommit 0;

    private _groupInfoBoxesCtrlGrp = _display displayCtrl IDC_GROUP_CT_GROUP;
    _groupInfoBoxesCtrlGrp ctrlSetPositionH (groupInfoBoxHeight * GRID_H);
    _groupInfoBoxesCtrlGrp ctrlCommit 0;

    private _groupListBox = _display displayCtrl IDC_GROUPSLIST;
    _groupListbox ctrlSetPositionH (groupInfoBoxHeight * GRID_H);
    _grouplistBox ctrlCommit 0;

    private _playersListBox = _display displayCtrl IDC_PLAYERSLIST;
    _playersListBox ctrlSetPositionH (groupInfoBoxHeight * GRID_H);
    _playersListBox ctrlCommit 0;
} else {
    _mapCtrl ctrlShow false;
};



_teleportCheckbox = _display displayCtrl IDC_TELEPORTCHECKBOX;

_mayTeleport = player getVariable ["f_var_mayTeleportToGroup", false];

if !(_mayTeleport) then
{
    _teleportCheckbox ctrlSetChecked false;
    _teleportCheckbox ctrlEnable false;
    _teleportCheckbox lbSetText [0, "Disabled"];
    _teleportCheckbox ctrlSetBackgroundColor [0.2,0.2,0.2,0.5];
    _teleportCheckbox ctrlCommit 0;
}
else
{
    _teleportCheckbox ctrlSetChecked true;
};


private _cancelDisabled = missionNamespace getVariable ["f_var_groupPicker_disableCancel", false];

if (_cancelDisabled) then
{
    private _cancelButton = _display displayCtrl IDC_GROUPPICKER_CANCELBUTTON;
    _cancelButton ctrlEnable false;
    missionNamespace setVariable ["f_var_groupPicker_disableCancel", nil];
};

if (missionNamespace getVariable ["f_var_groupPicker_forceGearscript", false]) then
{
    f_var_groupPicker_forceGearscript_internal = true;
    missionNamespace setVariable ["f_var_groupPicker_forceGearscript", nil];
};