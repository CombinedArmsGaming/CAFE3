#include "macros.hpp"

disableSerialization;

params ["_display"];

// Group name editor.
_group = group player;

_groupText = _display displayCtrl IDC_GROUPPICKER_CURRENTSQUADTEXT;
_groupText ctrlSetText (format ["You are in:\n%1", groupId _group]);

_groups = allGroups select
{
    ((side _x) isEqualTo (side _group)) and
    {
        SQUAD_IS_IMPORTANT(_x)
        or {((units _x) findIf { isPlayer _x }) >= 0}
    }
};

_groupList = _display displayCtrl IDC_GROUPSLIST;
[_grouplist] call f_fnc_populateGroupPicker;


_teleportCheckbox = _display displayCtrl IDC_GROUPPICKER_TELEPORTCHECKBOX;

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