#include "macros.hpp"

disableSerialization;

params ["_display", "_exitCode"];

if (_exitCode == 2) exitWith {};

if (_exitCode == 1) then
{
    _group = group player;

    _groupNameEditor = _display displayCtrl IDC_SQUADMARKER_DIALOG_GROUPEDIT;
    _newName = ctrlText _groupNameEditor;

    if !(_newName isEqualTo (groupId _group)) then
    {
        _group setGroupIdGlobal [_newName];
    };


    _colourList = _display displayCtrl IDC_SQUADMARKER_DIALOG_COLOURLISTBOX;
    _colourChoice = lbCurSel _colourList;
    _colourData = f_var_squadMarker_colourData param [_colourChoice, DEFAULT_COLOUR];

    SET_SQUAD_COLOUR_DIRECT(_group,_colourData);


    _iconList = _display displayCtrl IDC_SQUADMARKER_DIALOG_ICONLISTBOX;
    _iconChoice = lbCurSel _iconList;
    _iconData = f_var_squadMarker_iconData param [_iconChoice, ""];

    SET_SQUAD_ICON_DIRECT(_group,_iconData);

};
