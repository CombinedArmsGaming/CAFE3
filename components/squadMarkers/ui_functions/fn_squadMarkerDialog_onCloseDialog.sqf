#include "macros.hpp"

disableSerialization;

params ["_display", "_exitCode"];

if (_exitCode == 2) exitWith {};

if (_exitCode == 1) then
{
    _group = group player;

    // Edit squad name if changed.
    _groupNameEditor = _display displayCtrl IDC_SQUADMARKER_DIALOG_GROUPEDIT;
    _newName = ctrlText _groupNameEditor;

    if !(_newName isEqualTo (groupId _group)) then
    {
        _group setGroupIdGlobal [_newName];
        [_group] call f_fnc_maintainImportantSquad;
    };


    // Change colour of marker.
    _colourList = _display displayCtrl IDC_SQUADMARKER_DIALOG_COLOURLISTBOX;
    _colourChoice = lbCurSel _colourList;
    _colourData = f_var_squadMarker_colourData param [_colourChoice, DEFAULT_COLOUR];

    SET_SQUAD_COLOUR_DIRECT(_group,_colourData);


    // Change marker icon.
    _iconList = _display displayCtrl IDC_SQUADMARKER_DIALOG_ICONLISTBOX;
    _iconChoice = lbCurSel _iconList;
    _iconData = f_var_squadMarker_iconData param [_iconChoice, ""];

    SET_SQUAD_ICON_DIRECT(_group,_iconData);


    // Update marked specialists.
    _visibleRolesList = _display displayCtrl IDC_SQUADMARKER_DIALOG_VISIBLELISTBOX;
    _newVisibleRoles = [];
    _maxIdx = (lbSize _visibleRolesList) - 1;

    for "_i" from 0 to _maxIdx do
    {
        _newVisibleRoles pushBackUnique (_visibleRolesList lbData _i);
    };

    SET_SQUAD_SPECIALISTS_DIRECT(_group,_newVisibleRoles);

};
