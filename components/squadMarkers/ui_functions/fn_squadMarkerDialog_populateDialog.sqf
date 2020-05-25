#include "macros.hpp"

disableSerialization;

params ["_display"];

// Group name editor.
_group = group player;

_groupNameEditor = _display displayCtrl IDC_SQUADMARKER_DIALOG_GROUPEDIT;
_groupNameEditor ctrlSetText (groupid _group);


// Marker colour list.
_colourList = _display displayCtrl IDC_SQUADMARKER_DIALOG_COLOURLISTBOX;
{
    _colourList lbAdd _x;
} forEach f_var_squadMarker_colourChoices;


// Icon type list.
_iconList = _display displayCtrl IDC_SQUADMARKER_DIALOG_ICONLISTBOX;
{
    _iconList lbAdd _x;
} forEach f_var_squadMarker_iconChoices;


// Populating current marker settings into the marker panel.
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


// Finding current unit roles in the squad.
_uniqueRoles = [];

{
    _role = _x getVariable ["f_var_assignGear", ""];

    if !(_role isEqualTo "") then
    {
        _uniqueRoles pushBackUnique _role;
    };

} forEach (units _group);


// Removing currently marked roles from prior list.
_specialists = SQUAD_SPECIALISTS(_group);

{
    _uniqueRoles deleteAt (_uniqueRoles find _x);
} forEach _specialists;


// Populating specialist marker lists.
_availableRolesList = _display displayCtrl IDC_SQUADMARKER_DIALOG_AVAILABLELISTBOX;
{
    _availableRolesList lbAdd (toUpper _x);
    _availableRolesList lbSetData [_forEachIndex, _x];
} forEach _uniqueRoles;

_visibleRolesList = _display displayCtrl IDC_SQUADMARKER_DIALOG_VISIBLELISTBOX;
{
    _visibleRolesList lbAdd (toUpper _x);
    _visibleRolesList lbSetData [_forEachIndex, _x];
} forEach _specialists;
