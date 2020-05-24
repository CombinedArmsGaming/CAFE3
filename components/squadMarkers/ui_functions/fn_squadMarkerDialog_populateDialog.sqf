#include "macros.hpp"

disableSerialization;

params ["_display"];

_group = group player;

_groupNameEditor = _display displayCtrl IDC_SQUADMARKER_DIALOG_GROUPEDIT;
_groupNameEditor ctrlSetText (groupid _group);


_colourList = _display displayCtrl IDC_SQUADMARKER_DIALOG_COLOURLISTBOX;
{
    _colourList lbAdd _x;
} forEach f_var_squadMarker_colourChoices;


_iconList = _display displayCtrl IDC_SQUADMARKER_DIALOG_ICONLISTBOX;
{
    _iconList lbAdd _x;
} forEach f_var_squadMarker_iconChoices;


_currentIcon = SQUAD_ICON(_group);
_currentColour = SQUAD_COLOUR(_group);

_curColourIdx = (f_var_squadMarker_colourData findIf {_x isEqualTo _currentColour});
_curIconIdx = (f_var_squadMarker_iconData findIf {_x isEqualTo _currentIcon});

if (_curColourIdx >= 0) then
{
    _colourList lbSetCurSel _curColourIdx;
};

if (_curIconIdx >= 0) then
{
    _iconList lbSetCurSel _curIconIdx;
};
