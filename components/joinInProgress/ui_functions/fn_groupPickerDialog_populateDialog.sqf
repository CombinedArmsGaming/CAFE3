#include "macros.hpp"

disableSerialization;

params ["_display"];

// Group name editor.
_group = group player;

_groupText = _display displayCtrl IDC_GROUPPICKER_CURRENTSQUADTEXT;
_groupText ctrlSetText (groupId _group);

_groups = allGroups select
{
    ((side _x) isEqualTo (side _group)) and
    {
        SQUAD_IS_IMPORTANT(_x)
        or {((units _x) findIf { isPlayer _x }) >= 0}
    }
};

_groupList = _display displayCtrl IDC_GROUPPICKER_SQUADLIST;
{
    _members = count (units _x);
    _name = (groupId _x);
    _text = format ["%1 (%2)", _name, _members];

    if !(_name isEqualTo "Spectators") then
    {
        _idx = _groupList lbAdd _text;

        _groupList lbSetValue [_idx, (1000 - _members)];
        _groupList lbSetData [_idx, _name];

    };

} forEach _groups;

lbSortByValue _groupList;

for "_i" from 0 to (lbSize _groupList) do
{
    if ((_groupList lbData _i) isEqualTo (groupId _group)) exitWith
    {
        _groupList lbSetCurSel _i;
    };

};


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
